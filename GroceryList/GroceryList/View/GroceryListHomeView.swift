//
//  GroceryListHomeView.swift
//  GroceryList
//
//  Created by Shreya on 02/03/26.
//

import Foundation
import SwiftUI
import SwiftData

struct GroceryListHomeView: View {
    
    @Environment(\.modelContext) private var context
    
    // Macro to GroceryItem Data from Swift Data Model
    @Query(sort: \GroceryItem.name)
    private var groceryItems: [GroceryItem]
    
    @State private var viewModel: GroceryListViewModel = GroceryListViewModel()
    @State private var showAddSheet = false
    @State private var editingItem: GroceryItem? = nil
    
    // Filter items on the basis of Categories
    var filteredItem: [GroceryItem] {
        guard let filter = viewModel.selectedFilter else {
            return groceryItems
        }
        return groceryItems.filter { $0.category == filter }
    }
    
    private var groupedItems: [Category: [GroceryItem]] {
        Dictionary(grouping: filteredItem) { $0.category }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                CategoryBar(selectedFilter: $viewModel.selectedFilter)
                    .frame(height: 100)
                    .padding(.bottom, 16)
                contentList
            }
            .navigationTitle("Grocery List")
            .navigationDestination(item: $editingItem) { item in
                EditItemView(item: item, viewModel: viewModel)
            }
            .toolbar {
                addButton
            }
        }
        .sheet(isPresented: $showAddSheet) {
            AddItemView(viewModel: viewModel)
                .environment(\.modelContext, context)
        }
    }
    
    private var contentList: some View {
        Group {
            if filteredItem.isEmpty {
                Spacer()
                ContentUnavailableView(
                    "Your Grocery List is Empty",
                    systemImage: "cart",
                    description: Text("Add items from **+** icon at the top to get started")
                )
                Spacer()
            } else {
                listView
            }
        }
    }
    
    private var listView: some View {
        List {
            ForEach(Category.allCases, id: \.self) { category in
                if let categoryItems = groupedItems[category], !categoryItems.isEmpty {
                    sectionView(category: category, items: categoryItems)
                        .listSectionSeparator(.hidden, edges: .all)
                }
            }
        }
        .listStyle(.insetGrouped)
    }
    
    private func sectionView(category: Category, items: [GroceryItem]) -> some View {
        Section(category.displayName) {
            ForEach(items) { item in
                GroceryItemRow(groceryItem: item) {
                    viewModel.toggleCompletion(item)
                } onEdit: {
                    editingItem = item
                }
                .listRowSeparator(.hidden)
            }
            .onDelete { indexSet in
                deleteItems(at: indexSet, from: items)
            }
            .headerProminence(.increased)
        }
    }
    
    private func deleteItems(at offsets: IndexSet, from items: [GroceryItem]) {
        offsets.map { items[$0] }
            .forEach { viewModel.deleteItem($0, context: context)}
    }
    
    private var addButton: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                showAddSheet = true
            } label: {
                Image(systemName: "plus")
            }
        }
    }
}
