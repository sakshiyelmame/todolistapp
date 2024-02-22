//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Sakshi Yelmame on 22/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var todoArray: [ToDoList] = []
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<todoArray.count, id: \.self){ index in
                    ListCell(todo: todoArray[index])
                        .swipeActions {
                            Button {
                                DatabaseHelper.shared.deleteToDo(todo: todoArray[index])
                                todoArray.remove(at: index)
                            }label: {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                        .swipeActions {
                            Button {
                                openAlert(isAdd: false, index: index)
                            }label: {
                                Text("Update")
                            }
                            .tint(.indigo)
                        }
                }
            }
            .navigationTitle("To Do List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        openAlert(isAdd: true)
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .onAppear {
                todoArray = DatabaseHelper.shared.getAllToDo()
            }
        }
    }
}
// MARK: - Helper Methods
extension ContentView {
    
    func openAlert(isAdd: Bool, index: Int = 0) {
                let alertController = UIAlertController(title: isAdd ? "My To Do" : "Update To Do",
                                                message: isAdd ? "Please add to do here": "Please update to do here" ,
                                                preferredStyle: .alert)
        alertController.addTextField { firstnamefield in firstnamefield.placeholder = isAdd ? "Title" : todoArray[index].firstname
        }
        
        alertController.addTextField { lastnamefield in lastnamefield.placeholder = isAdd ? "Description" :
            todoArray[index].lastname
        }
        
        let save = UIAlertAction(title: isAdd ? "Save" : "Update", style: .default){ _ in
            if let firstname = alertController.textFields?.first?.text,
               let lastname = alertController.textFields?[1].text{
                let todo = ToDoList(firstname: firstname, lastname: lastname)
                if isAdd {
                    todoArray.append(todo) // Add
                    DatabaseHelper.shared.addToDo(todo: todo)// Realm Data Add
                } else {
                    DatabaseHelper.shared.updateToDo(oldToDo: todoArray[index], newToDo: todo)
                    todoArray[index] = todo // Update
                }
            }
        }
        alertController.addAction(save)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

