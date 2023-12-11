//
//  SettingsManager.swift
//  StudyTimer
//
//  Created by Barış Can Sertkaya on 11.12.2023.
//

import Foundation
import SwiftUI

import SwiftUI

class UserSettings: ObservableObject {
    
    static let shared = UserSettings()

    @Published var selectedThemeIndex: Int {
        didSet {
            UserDefaults.standard.set(selectedThemeIndex, forKey: "selectedThemeIndex")
        }
    }

    @Published var notificationsAllowed: Bool {
        didSet {
            UserDefaults.standard.set(notificationsAllowed, forKey: "notificationsAllowed")
        }
    }

    @Published var soundAllowed: Bool {
        didSet {
            UserDefaults.standard.set(soundAllowed, forKey: "soundAllowed")
        }
    }

    private init() {
        self.selectedThemeIndex = UserDefaults.standard.integer(forKey: "selectedThemeIndex")
        self.notificationsAllowed = UserDefaults.standard.bool(forKey: "notificationsAllowed")
        self.soundAllowed = UserDefaults.standard.bool(forKey: "soundAllowed")
    }
}

