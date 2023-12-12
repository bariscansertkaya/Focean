//
//  SettingsView.swift
//  StudyTimer
//
//  Created by Barış Can Sertkaya on 11.12.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                
                Form {
                    Section {
                        Toggle("Notifications", isOn: .constant(true))
                        //Toggle("Sound", isOn: $soundAllowed)
                    }
                    
                }
                .scrollContentBackground(.hidden)
                .tint(.blue)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.title3)
                                .bold()
                        })
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .background(BackgroundView())
        }
    }
}

#Preview {
    SettingsView()
}
