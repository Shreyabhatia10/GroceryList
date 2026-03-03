//
//  CategoryBar.swift
//  GroceryList
//
//  Created by Shreya on 02/03/26.
//

import Foundation
import SwiftUI

struct CategoryBar: View {
    
    @Binding var selectedFilter: Category? // nil means "All"
    @State var showAllCategory: Bool = true
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 8.0) {
                
                // All Pill
                if showAllCategory {
                    CategoryPill(
                        title: "All",
                        systemImage: "line.3.horizontal.decrease.circle",
                        isSelected: selectedFilter == nil,
                        tintColor: .accentColor.opacity(0.8)
                    ) {
                        selectedFilter = nil
                    }
                }
                
                // Category Specific Pills
                ForEach(Category.allCases, id: \.self) { category in
                    CategoryPill(
                        title: category.displayName,
                        systemImage: category.imageName,
                        isSelected: selectedFilter == category,
                        tintColor: category.color
                    ) {
                        selectedFilter = category
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 6)
        }
    }
}
