//
//  HomeViewModel.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 25.09.2025.
//

import Combine

@MainActor
class HomeViewModel: ObservableObject {
    @Published var menuItems: [MenuItem] = []
    @Published var categories = MenuItemCategory.allCases
    @Published var searchedKeyword = ""

    private let repository: MenuRepository

    init(repository: MenuRepository!) {
        self.repository = repository
    }

    func retrieve() {
        if searchedKeyword.isEmpty {
            Task {
                if let item = try? await repository.retrieveMenu() {
                    self.menuItems = item
                }
            }

        } else {
            menuItems = menuItems.filter { $0.title.contains(searchedKeyword) }
        }
    }
}
