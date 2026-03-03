//
//  GroceryItem.swift
//  GroceryList
//
//  Created by Shreya on 02/03/26.
//

import Foundation
import SwiftData

@Model
class GroceryItem {
    var id = UUID()
    var name: String
    var category: Category
    var isCompleted: Bool
    
    init(name: String, category: Category) {
        self.id = UUID()
        self.name = name
        self.category = category
        self.isCompleted = false
    }
}
