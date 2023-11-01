//
//  HomeView.swift
//  StudyTimer
//
//  Created by Barış Can Sertkaya on 3.08.2023.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.scenePhase) var scenePhase
    
    @State var timeValue: Double = 60
    @State var timeFinished: Bool = false
    @State var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(spacing: 10) {
                VStack(spacing: 10) {
                    Text("Welcome to the ")
                        .foregroundColor(.white)
                        .font(.system(size: 25,weight: .semibold,design: .default))
                    
                    Text("Focean")
                        .foregroundColor(.white)
                        .font(.system(size: 50, weight: .bold, design: .serif))
                }
                
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .padding()
                    
                    
                    Image("ocean")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 310, height: 310, alignment: .center)
                        .foregroundColor(.blue)
                        .scaleEffect(timerRunning ? 1.1 : 1 )
                        .animation(.easeInOut(duration: 2.5), value: timerRunning)
                    
                }
                
                
                Text(convertSecondsToTime(timeInSeconds: Int(timeValue)))
                    .foregroundColor(.white)
                    .font(.system(size: 80, weight: .thin, design: .default))
                    .scaleEffect(timerRunning ? 1.25 : 1 )
                    .animation(.easeInOut(duration: 2.5), value: timerRunning)
                    .onReceive(timer) { _ in
                        if timeValue > 0 && timerRunning {
                            timeValue -= 1
                        }
                        else if timeValue == 0 {
                            timeValue = 60
                            timerRunning = false
                            timeFinished = true
                        }
                    }
                
                Slider(value: $timeValue, in: 60...3600, step: 60)
                    .frame(width: 300)
                
                Button {
                    timerRunning.toggle()
                    
                } label: {
                    Text(timerRunning ? "Pause" : "Focus")
                        .foregroundColor(.white)
                        .font(.system(size: 25,weight: .semibold,design: .default))
                        .frame(width: 180,height: 50)
                }
                .buttonStyle(.borderedProminent)
                .onChange(of: scenePhase) { newValue in
                    if newValue == .background {
                        //Stop the timer
                        timerRunning = false
                        
                        //Send local notification
                        let content = UNMutableNotificationContent()
                        content.title = "Don't give up now!"
                        content.subtitle = "Continue your focus. You can do it."
                        content.sound = UNNotificationSound.default
                        // show this notification five seconds from now
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                        
                        // choose a random identifier
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                        
                        // add our notification request
                        UNUserNotificationCenter.current().add(request)
                    }
                }
                Spacer()
            }
            
            
            
        }
        .fullScreenCover(isPresented: $timeFinished) {
            TimeUpScreen()
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}