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

    var body: some Scene {
        WindowGroup {
//            ProfileScreen(viewModel: profileVieWModel)
            HomeScreen()
//            LoginScreen(viewModel: loginViewModel)
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
