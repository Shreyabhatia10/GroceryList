//
//  GroceryListViewModel.swift
//  GroceryList
//
//  Created by Shreya on 02/03/26.
//

import Foundation
import SwiftUI
import SwiftData

@Observable
class GroceryListViewModel {
    
    var selectedFilter: Category? = nil
    
    // To Add a Grocery Item to Swift Data Mdoel
    func addItem(name: String,
                 category: Category,
                 context: ModelContext) {
        let newItem = GroceryItem(name: name, category: category)
        context.insert(newItem)
    }
    
    // To Delete a Grocery Item to Swift Data Mdoel
    func deleteItem(_ item: GroceryItem, context: ModelContext) {
        context.delete(item)
    }
    
    // To Update a Grocery Item to Swift Data Mdoel
    func updateItem(_ item: GroceryItem, newName: String, newCategory: Category) {
        item.name = newName
        item.category = newCategory
    }
    
    func toggleCompletion(_ item: GroceryItem) {
        item.isCompleted.toggle()
    }
}
