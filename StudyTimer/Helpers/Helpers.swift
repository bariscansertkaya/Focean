//
//  Helpers.swift
//  StudyTimer
//
//  Created by Barış Can Sertkaya on 3.08.2023.
//

import Foundation

func convertSecondsToTime(timeInSeconds: Int) -> String {
    let hours = timeInSeconds / 3600
    let minutes = (timeInSeconds % 3600) / 60
    let seconds = timeInSeconds % 60
    
    return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
}

func chooseNotificationText() -> String {
    
    let texts =
    [
        "Continue your focus. You can do it!",
        "Small steps lead to big results.",
        "Believe in yourself. You've got this!",
        "Your effort today is tomorrow's success.",
        "Each effort counts, no matter how small.",
        "Believe in the power of your determination."
    ]
    
    if let randomText = texts.randomElement() {
        return randomText
    }
    
    return texts[0]
}
