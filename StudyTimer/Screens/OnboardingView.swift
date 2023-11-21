//
//  OnboardingView.swift
//  StudyTimer
//
//  Created by Barış Can Sertkaya on 21.11.2023.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(spacing: 30) {
                Text("Welcome to the ")
                    .foregroundColor(.white)
                    .font(.system(size: 25,weight: .semibold,design: .default))
                
                Text("Focean")
                    .foregroundColor(.white)
                    .font(.system(size: 50, weight: .bold, design: .serif))
                
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Choose your focus duration and dive into our calming theme.")
                    
                    Text("Ride the waves of productivity until your study session ends.")
                    
                    Text("Focean will kindly remind you with notifications if you step away while your timer is running.")
                }
                .frame(maxWidth: 500)
                .font(.headline)
                .padding(.horizontal)
                .foregroundStyle(.white)
                
                Button(action: {
                    hasSeenOnboarding = true
                }, label: {
                    Text("Begin")
                        .foregroundColor(.white)
                        .font(.system(size: 25,weight: .semibold,design: .default))
                        .frame(width: 180,height: 50)
                })
                .buttonStyle(.borderedProminent)
            }
            .padding(.horizontal)
        }
        
    }
}

#Preview {
    OnboardingView()
}
