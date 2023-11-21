//
//  HomeView.swift
//  StudyTimer
//
//  Created by Barış Can Sertkaya on 3.08.2023.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.scenePhase) var scenePhase
    
    @State var timeValue: Double = 300
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
                    
                    Image("ocean")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .foregroundColor(.blue)
                        .scaleEffect(timerRunning ? 1.1 : 1 )
                        .animation(.easeInOut(duration: 2.5), value: timerRunning)
                        .padding()
                    
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 800)
                
                
                Text(convertSecondsToTime(timeInSeconds: Int(timeValue)))
                    .foregroundColor(.white)
                    .font(.system(size: 80, weight: .thin, design: .default))
                    .scaleEffect(timerRunning ? 1.1 : 1 )
                    .animation(.easeInOut(duration: 2.5), value: timerRunning)
                    .onReceive(timer) { _ in
                        if timeValue > 0 && timerRunning {
                            timeValue -= 1
                        }
                        else if timeValue == 0 {
                            timeValue = 300
                            timerRunning = false
                            timeFinished = true
                        }
                    }
                
                Slider(value: $timeValue, in: 300...10800, step: 300)
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
                    if newValue == .background && timerRunning {
                        //Send local notification
                        let content = UNMutableNotificationContent()
                        content.title = "Don't Give Up Now!"
                        content.subtitle = chooseNotificationText()
                        content.sound = UNNotificationSound.default
                        
                        // show this notification 3 seconds from now
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
                        
                        // choose a random identifier
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                        
                        // add our notification request
                        UNUserNotificationCenter.current().add(request)
                    }
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .fullScreenCover(isPresented: $timeFinished) {
            TimeUpView()
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
