//
//  DatabaseHelper.swift
//  ToDoListApp
//
//  Created by Sakshi Yelmame on 22/02/24.
//

import RealmSwift

// Singleton class - Design Pattern

class DatabaseHelper {
    static let shared = DatabaseHelper()
    private var realm = try! Realm()

    init(){
        print(databaseURL())
    }
    
    func databaseURL() -> URL?{
        return realm.configuration.fileURL
    }

    func addToDo(todo: ToDoList){
        try! realm.write({
            realm.add(todo)
        })
    }

    func updateToDo(oldToDo: ToDoList, newToDo: ToDoList){
        try! realm.write({
            oldToDo.firstname = newToDo.firstname
            oldToDo.lastname = newToDo.lastname
        })
    }

    func deleteToDo(todo: ToDoList){
        try! realm.write({
            realm.delete(todo)
        })
    }

    func getAllToDo() -> [ToDoList]{
        return Array(realm.objects(ToDoList.self))
    }

}
