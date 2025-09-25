//
//  ProfileViewModel.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 25.09.2025.
//

import Combine

class ProfileViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""

    @Published var editingFirstName = false
    @Published var editingLastName = false
    @Published var editingEmail = false

    init() {
        firstName = UserSettings.shared.firstName ?? ""
        lastName = UserSettings.shared.lastName ?? ""
        email = UserSettings.shared.email ?? ""
    }

    func finishEditing() {
        UserSettings.shared.firstName = firstName
        UserSettings.shared.lastName = lastName
        UserSettings.shared.email = email
    }
}
