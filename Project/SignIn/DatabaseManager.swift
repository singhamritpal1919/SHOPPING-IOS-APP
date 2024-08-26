//
//  DatabaseManager.swift
//  ProjectApp
//
//  Created by Amritpal Gill on 2024-07-16.
//
import Foundation
import FirebaseDatabase


class DatabaseManager :ObservableObject{
    
    private let database = Database.database().reference();
    
    func addItem(_ item: Item){
        let itemRef = database.child("items").child(item.id)
        itemRef.setValue(["name": item.name,"description":item.description])
    }
    
    func updateItem(_ item: Item){
        let itemRef = database.child("items").child(item.id)
        itemRef.updateChildValues(["name": item.name,"description":item.description])
    }
    
    func deleteItem(_ item: Item){
        let itemRef = database.child("items").child(item.id)
        itemRef.removeValue()
    }
    
    func fetchItem(completion: @escaping(([Item]) -> Void )){
        database.child("items").observe(.value){ snapShot in
            var items:[Item] = []
            for child in snapShot.children{
                if let snapshot = child as? DataSnapshot,
                   let value = snapshot.value as? [String: Any],
                   let name = value["name"] as? String,
                   let description = value["description"] as? String{
                    let item = Item(id: snapshot.key,name : name,description:description)
                    items.append(item)
                }
            }
            completion(items)
        }
    }

}
