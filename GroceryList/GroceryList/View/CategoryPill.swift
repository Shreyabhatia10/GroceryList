//
//  CategoryPill.swift
//  GroceryList
//
//  Created by Shreya on 02/03/26.
//

import Foundation
import SwiftUI

struct CategoryPill: View {
    
    let title: String
    let systemImage: String
    let isSelected: Bool
    let tintColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8.0) {
                Image(systemName: systemImage)
                    .imageScale(.medium)
                    .foregroundStyle(tintColor)
                Text(title)
                    .font(.subheadline)
                    .fontWeight(isSelected ? .semibold : .regular)
                    .foregroundStyle(tintColor)
            }
        }
        .buttonStyle(.plain)
        .frame(width: 82, height: 82)
        .background(isSelected ? tintColor.opacity(0.14) : Color(.systemGray6))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isSelected ? tintColor : Color(.systemGray4), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
