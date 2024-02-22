//
//  List.swift
//  ToDoListApp
//
//  Created by Sakshi Yelmame on 22/02/24.
//

import RealmSwift

class ToDoList: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var firstname = ""
    @Persisted var lastname = ""
    
    convenience init(firstname: String, lastname: String){
        self.init()
        self.firstname = firstname
        self.lastname = lastname
    }
    
    static var tempData: [ToDoList] = [
        ToDoList(firstname: "Sakshi", lastname: "Yelmame"),
        ToDoList(firstname: "Samarth", lastname: "Yelmame")
    ]
}
