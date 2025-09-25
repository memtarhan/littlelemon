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
    @StateObject var profileVieWModel = ProfileViewModel()

    private var menuRepository: MenuRepository

    init() {
        let menuLocalService = MenuLocalService(viewContext: persistenceController.container.viewContext)
        let menuNetworkService = MenuService()
        menuRepository = MenuRepository(localService: menuLocalService, networkService: menuNetworkService)
    }

    var body: some Scene {
        WindowGroup {
//            ProfileScreen(viewModel: profileVieWModel)
            HomeScreen(menuRepository: menuRepository)
//            LoginScreen(viewModel: loginViewModel)
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
