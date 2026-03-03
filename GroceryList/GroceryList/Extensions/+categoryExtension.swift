//
//  +categoryExtension.swift
//  GroceryList
//
//  Created by Shreya on 02/03/26.
//

import Foundation
import SwiftUI

extension Category {
    
    // Tune these colors per your category
    var color: Color {
        switch self {
        case .milk: return .brown.opacity(0.8)
        case .vegetables: return .green.opacity(0.8)
        case .fruits: return .red.opacity(0.8)
        case .breads: return .mint.opacity(0.8)
        case .meats: return .orange.opacity(0.8)
        }
    }
}
