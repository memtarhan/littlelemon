//
//  MenuRepository.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 24.09.2025.
//

import CoreData
import Foundation

struct MenuRepository: NetworkWrapper {
    private let localService: MenuLocalService
    private let networkService: MenuService

    init(localService: MenuLocalService, networkService: MenuService) {
        self.localService = localService
        self.networkService = networkService
    }

    func retrieveMenu() async throws -> [MenuItem] {
        let localItems = localService.fetchMenuItems()

        guard localItems.isEmpty else {
            let response = try await networkService.retrieveMenu()
            
//            localService.save(menuItems: response.menu)
            return response.menu.map {
                MenuItem(id: $0.id,
                         title: $0.title,
                         description: $0.description,
                         price: Double($0.price) ?? 0.0,
                         image: $0.image,
                         category: MenuItemCategory(rawValue: $0.category) ?? .starters)
            }
        }

        var items: [MenuItem] = []

        for item in localItems {
            if let title = item.title,
               let description = item.itemDecription,
               let image = item.image,
               let category = item.category {
                let id = Int(item.id)
                let price = item.price

                let newItem = MenuItem(id: id,
                                       title: title,
                                       description: description,
                                       price: price,
                                       image: image,
                                       category: MenuItemCategory(rawValue: category) ?? .starters)

                items.append(newItem)
            }
        }

        return items
    }
}
