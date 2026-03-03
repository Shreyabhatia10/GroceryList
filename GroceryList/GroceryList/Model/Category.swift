//
//  Category.swift
//  GroceryList
//
//  Created by Shreya on 02/03/26.
//

import Foundation

enum Category: String, CaseIterable, Codable, Identifiable {
    case milk
    case vegetables
    case fruits
    case breads
    case meats
    
    var id: String { rawValue }
    
    var displayName: String {
        rawValue.capitalized
    }
    
    var imageName: String {
        switch self {
        case .milk: return "cart"
        case .vegetables: return "leaf"
        case .fruits: return "applelogo"
        case .breads: return "birthday.cake"
        case .meats: return "fork.knife"
        }
    }
}
