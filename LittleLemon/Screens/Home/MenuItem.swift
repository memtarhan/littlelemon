//
//  MenuItem.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 25.09.2025.
//

import Foundation

enum MenuItemCategory: String, CaseIterable {
    case starters
    case mains
    case desserts
    case sides

    var title: String { rawValue.capitalized }
}

struct MenuItem: Identifiable {
    var id: Int
    var title: String
    var description: String
    var price: Double
    var image: String
    var category: MenuItemCategory

    static let samples = [
        MenuItem(id: 1,
                 title: "Greek Salad",
                 description: "The famous greek salad of crispy lettuce, peppers, olives, our Chicago.",
                 price: 10,
                 image: "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true",
                 category: .starters),
        MenuItem(id: 2,
                 title: "Lemon Desert",
                 description: "Traditional homemade Italian Lemon Ricotta Cake.",
                 price: 14.59,
                 image: "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/lemonDessert%202.jpg?raw=true",
                 category: .mains),
    ]
}
