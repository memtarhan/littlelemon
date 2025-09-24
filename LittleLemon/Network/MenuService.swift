//
//  MenuService.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 24.09.2025.
//

import Foundation

struct MenuService: NetworkWrapper {
    func retrieveMenu() async throws -> MenuResponse {
        guard let url = Endpoints.menu.url else {
            throw HTTPError.badURL
        }

        let response: MenuResponse = try await handleDataTask(from: url)
        return response
    }
}
