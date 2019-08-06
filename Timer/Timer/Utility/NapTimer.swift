//
//  NapTimer.swift
//  Timer
//
//  Created by AlphaDVLPR on 8/6/19.
//  Copyright © 2019 AlphaDVLPR. All rights reserved.
//

import Foundation

protocol NapTimerDelegate: class {
    func timerCompleted()
    func timerStopped()
    func timerSecondTicked()
}

class NapTimer {
    
    weak var delegate: NapTimerDelegate?
    private var timer: Timer?
    var timeLeft: TimeInterval?
    var isOn: Bool {
        return timeLeft == nil ? false : true
    }
    
    func timeLeftAsString() -> String {
        let timeRemaining = Int(timeLeft ?? 3 * 60)
        let minutesRemaining = timeRemaining / 60
        let secondsRemaining = timeRemaining - (minutesRemaining * 60)
        
        return String(format: "%02D : %02D", arguments: [minutesRemaining, secondsRemaining])
    }
    
    func startTimer(_ time: TimeInterval) {
        if isOn {
            print("Timer is already running!")
        } else {
            self.timeLeft = time
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
                self.secondTicked()
            })
            
        }
    }
    
    func stopTimer() {
        
        timeLeft = nil
        timer?.invalidate()
        print("Stopped timer!")
        delegate?.timerStopped()
    }
    
    private func secondTicked() {
        guard let timeLeft = timeLeft else { return }
        if timeLeft > 0 {
            
            self.timeLeft = timeLeft - 1
            print(self.timeLeftAsString())
            delegate?.timerSecondTicked()
            
            
        } else {
            
            stopTimer()
            delegate?.timerCompleted()
        }
    }
    
    
}
