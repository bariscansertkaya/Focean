//
//  HomeView.swift
//  StudyTimer
//
//  Created by Barış Can Sertkaya on 3.08.2023.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("showOnboarding") var showOnboarding: Bool = true
    
    @Environment(\.scenePhase) var scenePhase
    
    @StateObject private var timerManager = TimerManager()
    
    @State private var showSettings = false
    @State private var showStore = false
    
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(spacing: 10) {
                
                VStack(spacing: 10) {
                    Text("Welcome to the ")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold, design: .default))
                        .opacity(timerManager.timerRunning ? 0:1)
                        .animation(.linear(duration: 0.5), value: timerManager.timerRunning)
                    
                    Text("Focean")
                        .foregroundColor(.white)
                        .font(.system(size: timerManager.timerRunning ? 60:50, weight: .bold, design: .serif))
                        .offset(timerManager.timerRunning ? CGSize(width: 0, height: -20.0) : .zero)
                        .animation(.easeOut(duration: 0.75), value: timerManager.timerRunning)
                        .frame(width: 300, height: 80)
                }
                
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                    
                    Image("ocean")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .padding()
                        .scaleEffect(timerManager.timerRunning ? 1.11 : 1 )
                        .animation(.easeInOut(duration: 2), value: timerManager.timerRunning)
                    
                }
                .padding()
                .frame(maxWidth: 600, maxHeight: 600)
                
                Text(convertSecondsToTime(timeInSeconds: timerManager.timeRemaining))
                    .foregroundColor(.white)
                    .font(.system(size: 80, weight: .thin, design: .default))
                    .scaleEffect(timerManager.timerRunning ? 1.1 : 1 )
                    .animation(.easeInOut(duration: 2), value: timerManager.timerRunning)
                
                Slider(value: $timerManager.selectedTime, in: 300...10800, step: 300)
                    .frame(width: 300)
                
                Button {
                    if timerManager.timerRunning {
                        timerManager.stopTimer()
                        
                    } else {
                        timerManager.startTimer()
                    }
                } label: {
                    Text(timerManager.timerRunning ? "Pause" : "Focus")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold, design: .default))
                        .frame(width: 180, height: 50)
                }
                .buttonStyle(.borderedProminent)
                .onChange(of: scenePhase) { newValue in
                    if newValue == .background, timerManager.timerRanInBackground {
                        sendNotification()
                    }
                }
            }
            .fullScreenCover(isPresented: $timerManager.timerFinished, content: {
                TimeUpView()
            })
            .frame(maxWidth: .infinity)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showSettings = true
                } label: {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.white)
                        .font(.title3)
                }
                .hidden()
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    //Store View
                    showStore = true
                } label: {
                    Image(systemName: "cart.fill")
                        .foregroundColor(.white)
                        .font(.title3)
                }
                .hidden()
            }
        }
        .fullScreenCover(isPresented: $showSettings, content: {
            SettingsView()
        })
        .fullScreenCover(isPresented: $showStore, content: {
            StoreView()
        })
        .fullScreenCover(isPresented: $showOnboarding, content: {
            OnboardingView()
                .onDisappear(perform: {
                    // Request notifications permission
                    requestNotificationPermission()
                })
        })
        
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
