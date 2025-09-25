//
//  HomeViewModel.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 25.09.2025.
//

import Combine

class HomeViewModel: ObservableObject {
    var repository: MenuRepository
    
    init(repository: MenuRepository!) {
        self.repository = repository
    }

    func fetch() {
        Task {
            try? await repository.retrieveMenu()
        }
    }
}
