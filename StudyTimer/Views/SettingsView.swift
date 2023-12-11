//
//  SettingsView.swift
//  StudyTimer
//
//  Created by Barış Can Sertkaya on 11.12.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("notificationsAllowed") var notificationsAllowed = true
    @AppStorage("soundAllowed") var soundAllowed = true
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Toggle("Notifications", isOn: $notificationsAllowed)
                    Toggle("Sound", isOn: $soundAllowed)
                }
                
            }
            .background(BackgroundView())
            .scrollContentBackground(.hidden)
            .tint(.cyan)
            .preferredColorScheme(.dark)
            .navigationTitle("Settings")
            
        }
    }
}

#Preview {
    SettingsView()
}
