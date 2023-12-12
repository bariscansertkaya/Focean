//
//  NotificationManager.swift
//  StudyTimer
//
//  Created by Barış Can Sertkaya on 12.12.2023.
//

import Foundation
import UserNotifications

func sendNotification() {
    let content = UNMutableNotificationContent()
    content.title = chooseNotificationText()
    content.sound = UNNotificationSound.default
    
    // Show this notification 3 seconds from now
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
    
    // Choose a random identifier
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    // Add our notification request
    UNUserNotificationCenter.current().add(request)
}

func chooseNotificationText() -> String {
    
    let texts =
    [
        "You can do it!",
        "Small steps to big results.",
        "You've got this!",
        "Today's effort is tomorrow's success.",
        "Each effort counts.",
        "Remember your determination.",
        "Keep pushing forward, you're unstoppable!",
        "Hold onto your dedication."
    ]
    
    if let randomText = texts.randomElement() {
        return randomText
    }
    
    return texts[0]
}

func requestNotificationPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
        if error != nil {
            print(error!.localizedDescription)
        } else {
            //Permission Granted
        }
    }
}


