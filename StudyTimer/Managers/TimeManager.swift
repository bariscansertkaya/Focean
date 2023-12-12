//
//  TimeManager.swift
//  StudyTimer
//
//  Created by Barış Can Sertkaya on 10.12.2023.
//

import Foundation

import SwiftUI

class TimerManager: ObservableObject {
    
    @Published var selectedTime: Double = 10 {
        didSet {
            timeRemaining = Int(selectedTime)
            timerRunning = false
        }
    }
    @Published private(set) var timeRemaining = 300 // Defult time in seconds (5 minutes)
    @Published var timerRunning = false
    @Published var timerRanInBackground = false
    @Published var timerFinished = false
    
    private var backgroundTime: Date?
    private var timer: Timer?
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        timeRemaining = Int(selectedTime)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func appDidEnterBackground() {
        backgroundTime = Date()
        if timerRunning { timerRanInBackground = true }
        stopTimer()
    }
    
    @objc func appWillEnterForeground() {
        if let backgroundTime = backgroundTime, timerRanInBackground {
            let elapsedTime = Int(Date().timeIntervalSince(backgroundTime)) //Calculate elapsed time since app went to background
            timeRemaining -= elapsedTime
            if timeRemaining < 0 {
                timeRemaining = 0
            }
            startTimer()
        }
    }
    
    func startTimer() {
        timerRunning = true
        timerRanInBackground = false
        timerFinished = false
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.timerRunning {
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    self.stopTimer()
                    self.timerFinished = true
                    self.resetTimer()
                }
            }
        }
    }
    
    func stopTimer() {
        timerRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    func resetTimer() {
        timeRemaining = Int(selectedTime)
    }
}
