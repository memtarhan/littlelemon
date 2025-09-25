//
//  UserSettings.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 25.09.2025.
//

class UserSettings {
    public static let shared = UserSettings()

    @UserDefaultable(key: "UserSettings_isLoggedIn", defaultValue: false)
    var isLoggeedIn: Bool

    @UserDefaultable(key: "UserSettings_firstName", defaultValue: nil)
    var firstName: String?

    @UserDefaultable(key: "UserSettings_lastName", defaultValue: nil)
    var lastName: String?

    @UserDefaultable(key: "UserSettings_email", defaultValue: nil)
    var email: String?
}
