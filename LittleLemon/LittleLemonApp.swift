//
//  LittleLemonApp.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 24.09.2025.
//

import SwiftUI

@main
struct LittleLemonApp: App {
    let persistenceController = PersistenceController.shared

    @StateObject var loginViewModel = LoginViewModel()
    @StateObject var profileViewModel = ProfileViewModel()

    private var menuRepository: MenuRepository

    init() {
        let menuLocalService = MenuLocalService(viewContext: persistenceController.container.viewContext)
        let menuNetworkService = MenuService()
        menuRepository = MenuRepository(localService: menuLocalService, networkService: menuNetworkService)
    }

    var body: some Scene {
        WindowGroup {
            if UserSettings.shared.isLoggeedIn {
                HomeScreen(viewModel: HomeViewModel(repository: menuRepository))
                    .environmentObject(profileViewModel)

            } else {
                LoginScreen(viewModel: loginViewModel)
                    .environmentObject(HomeViewModel(repository: menuRepository))
                    .environmentObject(profileViewModel)
            }
        }
    }
}
