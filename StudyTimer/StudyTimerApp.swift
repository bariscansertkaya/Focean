//
//  StudyTimerApp.swift
//  StudyTimer
//
//  Created by Barış Can Sertkaya on 3.08.2023.
//

import SwiftUI

@main
struct StudyTimerApp: App {
    
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    let center = UNUserNotificationCenter.current()
        
        init() {
            center.requestAuthorization(options: [.sound , .alert , .badge ], completionHandler: { (granted, error) in
                if error != nil {
                    // Handle the error here.
                }
                // Enable or disable features based on the authorization.
            })
        }
    
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                ContentView()
            }
            else {
                OnboardingView()
            }
        }
    }
}
