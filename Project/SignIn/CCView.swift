//
//  CCView.swift
//  ProjectApp
//
//  Created by Amritpal Gill on 2024-07-16.
//

import SwiftUI

struct CCView: View {
    @StateObject private var databaseManager = DatabaseManager()
    @State private var items:[Item] = []
    @State private var newItemName = ""
    @State private var newItemdescription = ""
    @State private var isEditeMode = false
    @State private var selectedItem : Item?
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(items){ item in
                        VStack(alignment : .leading){
                            Text(item.name).font(.headline)
                            Text(item.description).font(.subheadline)
                        }
                        .onTapGesture {
                            selectedItem = item
                            newItemName = item.name
                            newItemdescription = item.description
                            isEditeMode = true
                        }
                        
                    }
                    .onDelete(perform : deleteItems)
                }
                .onAppear{
                    databaseManager.fetchItem{ fetchItem in
                        self.items = fetchItem
                    
                    }
                }
                
                HStack{
                    TextField("Name",text: $newItemName)
                        .padding()
                    TextField("Description",text: $newItemdescription)
                    Button(isEditeMode ? "Update" : "Add"){
                        if isEditeMode, let item = selectedItem {
                            var updateditem = item
                            updateditem.name = newItemName
                            updateditem.description = newItemdescription
                            databaseManager.updateItem(updateditem)
                            isEditeMode = false
                        }else{
                            let newItem = Item(name: newItemName, description: newItemdescription)
                            databaseManager.addItem(newItem)
                        }
                        newItemName = ""
                        newItemdescription = ""
                        selectedItem = nil
                    }
                }
                .padding()
            }
            .navigationTitle("Items : ")
            .navigationBarItems(trailing: EditButton())
        }
        
    }
    
    private func deleteItems(at offsets : IndexSet){
        for index in offsets{
            let item = items[index]
            databaseManager.deleteItem(item)
        }
        items.remove(atOffsets: offsets)
    }
}

struct ContentView_preview : PreviewProvider{
    static var previews: some View{
        CCView()
    }
}
