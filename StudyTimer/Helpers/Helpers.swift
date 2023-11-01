//
//  Helpers.swift
//  StudyTimer
//
//  Created by Barış Can Sertkaya on 3.08.2023.
//

import Foundation

func convertSecondsToTime(timeInSeconds: Int) -> String {
    
    let minutes = timeInSeconds / 60
    
    let seconds = timeInSeconds % 60
    
    return String(format: "%02i:%02i", minutes,seconds)
}
