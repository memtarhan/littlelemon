//
//  Models.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 24.09.2025.
//

import Foundation

enum HTTPError: Error {
    case badURL
}

protocol APIResponse: Decodable { }

struct MenuResponse: APIResponse {
    var menu: [MenuItemResponse]
}

struct MenuItemResponse: APIResponse {
    var id: Int
    let title: String
    let description: String
    let price: String
    let image: String
    let category: String
}
