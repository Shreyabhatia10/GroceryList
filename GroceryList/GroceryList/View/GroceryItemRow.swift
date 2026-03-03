//
//  GroceryItemRow.swift
//  GroceryList
//
//  Created by Shreya on 02/03/26.
//

import Foundation
import SwiftUI

struct GroceryItemRow: View {
    
    var groceryItem: GroceryItem
    var toggle: () -> Void
    var onEdit: () -> Void
    
    var body: some View {
        let categoryColor = groceryItem.category.color
        
        HStack(spacing: 12) {
            
            // Category Item in colored circle
            ZStack {
                Circle()
                    .fill(categoryColor.opacity(0.1))
                    .frame(width: 36, height: 36)
                Image(systemName: groceryItem.category.imageName)
                    .foregroundColor(categoryColor)
                    .font(.system(size: 16, weight: .semibold))
            }
            .padding(.leading, 4)
            
            // Toggle completion
            Button {
                withAnimation(.spring(response: 0.25, dampingFraction: 0.7)) {
                    toggle()
                }
            } label: {
                Image(systemName: groceryItem.isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(groceryItem.isCompleted ? .green : .secondary)
            }
            .buttonStyle(.borderless)

            // Text Block
            VStack(alignment: .leading, spacing: 4.0) {
                Text(groceryItem.name)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.primary)
                    .strikethrough(groceryItem.isCompleted, color: .secondary)
                
                Text(groceryItem.category.displayName)
                    .font(.caption2)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(categoryColor.opacity(0.15))
                    .foregroundStyle(categoryColor)
                    .clipShape(Capsule())
            }
            
            Spacer(minLength: 8)
            
            // Edit Button
            Button(action: onEdit) {
                Image(systemName: "pencil")
                    .font(.system(size: 15, weight: .semibold))
                    .padding(8)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .buttonStyle(.borderless)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color(.white))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .strokeBorder(Color(.separator).opacity(0.2), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 2)
        .contentShape(Rectangle())
    }
}
