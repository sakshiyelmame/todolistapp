//
//  ListCell.swift
//  ToDoListApp
//
//  Created by Sakshi Yelmame on 22/02/24.
//

import SwiftUI

struct ListCell: View {
    var todo: ToDoList
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(todo.firstname)
                .font(.headline)
            Text(todo.lastname)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
    }
    
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(todo: ToDoList.tempData.first!)
    }
}
