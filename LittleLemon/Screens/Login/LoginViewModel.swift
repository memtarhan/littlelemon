//
//  LoginViewModel.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 25.09.2025.
//

import Combine

class LoginViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""

    @Published var isLoginButtonEnabled = false

    @Published var loading = false
    @Published var navigateToHome = false


    func login() {
        loading = true
        if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
            UserSettings.shared.firstName = firstName
            UserSettings.shared.lastName = firstName
            UserSettings.shared.email = email
            UserSettings.shared.isLoggeedIn = true

            isLoggedIn = true
            
            navigateToHome.toggle()

        } else {
            UserSettings.shared.isLoggeedIn = true

            loading = false
            isLoggedIn = false
        }
    }

    func validateCredentials() {
        isLoginButtonEnabled = !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty
    }
}
