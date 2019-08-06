//
//  NapTimer.swift
//  Timer
//
//  Created by AlphaDVLPR on 8/6/19.
//  Copyright © 2019 AlphaDVLPR. All rights reserved.
//

import Foundation

class NapTimer {
    
    private var timer: Timer?
    var timeLeft: TimeInterval?
    var isOn: Bool {
        return timeLeft == nil ? false : true
    }
    
    func startTimer(_ time: TimeInterval) {
        if isOn {
            print("Timer is already running!")
        } else {
            self.timer = Timer(timeInterval: 1, repeats: true, block: { (_) in
                self.secondTicked()
            })
            
        }
    }
    
    func stopTimer() {
        
        timeLeft = nil
        timer?.invalidate()
        print("Stopped timer!")
    }
    
    private func secondTicked() {
        guard let timeLeft = timeLeft else { return }
        if timeLeft > 0 {
            
            self.timeLeft = timeLeft - 1
            print(self.timeLeft as Any)
            
            
        } else {
            
            stopTimer()
        }
    }
}
