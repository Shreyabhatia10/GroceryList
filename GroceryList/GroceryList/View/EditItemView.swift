//
//  EditItemView.swift
//  GroceryList
//
//  Created by Shreya on 02/03/26.
//

import Foundation
import SwiftUI

struct EditItemView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var groceryItem: GroceryItem
    var viewModel: GroceryListViewModel
    
    @State private var name: String
    @State private var category: Category
    @State private var selectedCategory: Category? = nil
    
    // Validation
    private var isFormValid: Bool {
        !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    init(item: GroceryItem, viewModel: GroceryListViewModel) {
        self.groceryItem = item
        self.viewModel = viewModel
        _name = State(initialValue: item.name)
        _category = State(initialValue: item.category)
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Item Name", text: $name)
            }
            
            Section {
                CategoryBar(selectedFilter: $selectedCategory, showAllCategory: false)
            }
            .padding(.leading, -12)
        }
        .navigationTitle("Edit Item")
        .toolbar {
            Button("Save") {
                viewModel.updateItem(groceryItem, newName: name, newCategory: selectedCategory ?? category)
                dismiss()
            }
            .disabled(!isFormValid)
        }
    }
}
