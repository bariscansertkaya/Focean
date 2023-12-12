//
//  OnboardingView.swift
//  StudyTimer
//
//  Created by Barış Can Sertkaya on 21.11.2023.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("showOnboarding") var showOnboarding: Bool = true
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(spacing: 30) {
                Text("Welcome to the ")
                    .foregroundColor(.white)
                    .font(.system(size: 25,weight: .semibold,design: .default))
                
                Text("Focean")
                    .foregroundColor(.white)
                    .font(.system(size: 60, weight: .bold, design: .serif))
                
                
                VStack(alignment: .leading, spacing: 30) {
                    Text("Focean is a simple focus timer designed with a minimalist approach.")
                    
                    Text("Set your focus duration and immerse yourself in our calming theme.")
                    
                    Text("Stay productive until your work session ends.")
                    
                    Text("Focean will gently remind you with notifications if you close the app while your timer is running.")
                }
                .frame(maxWidth: 500)
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.horizontal)
                .padding(.horizontal)
                .foregroundStyle(.white)
                
                Button(action: {
                    showOnboarding = false
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
