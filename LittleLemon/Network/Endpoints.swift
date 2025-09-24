//
//  Endpoints.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 24.09.2025.
//

import Foundation

fileprivate let baseURL = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API"

enum Endpoints {
    case menu

    var url: URL? {
        switch self {
        case .menu:
            URL(string: "\(baseURL)/main/menu.json")
        }
    }
}
