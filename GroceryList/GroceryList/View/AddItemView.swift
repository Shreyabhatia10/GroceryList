//
//  AddItemView.swift
//  GroceryList
//
//  Created by Shreya on 02/03/26.
//

import Foundation
import SwiftUI

struct AddItemView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var viewModel: GroceryListViewModel
    @State private var selectedCategory: Category? = nil
    
    @State private var name: String = ""
    @State private var category: Category = .milk
    
    // Validation
    private var isFormValid: Bool {
        !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        selectedCategory != nil
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Item Name", text: $name)
                }
                Section {
                    CategoryBar(selectedFilter: $selectedCategory, showAllCategory: false)
                }
                .padding(.leading, -12)
            }
            .navigationBarTitle("Add Item")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add Item") {
                        guard let category = selectedCategory else { return }
                        
                        viewModel.addItem(
                            name: name.trimmingCharacters(in: .whitespacesAndNewlines),
                            category: category,
                            context: context
                        )
                        
                        dismiss()
                    }
                    .disabled(!isFormValid) // 🔥 disables button if invalid
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
