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
    
    if hours > 0 {
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    } else {
        return String(format: "%02i:%02i", minutes, seconds)
    }
}


