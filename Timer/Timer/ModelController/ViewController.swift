//
//  ViewController.swift
//  Timer
//
//  Created by AlphaDVLPR on 8/6/19.
//  Copyright © 2019 AlphaDVLPR. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeButton: UIButton!
    
    var napTimer = NapTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        napTimer.delegate = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func timeButtonTapper(_ sender: Any) {
        
        if napTimer.isOn {
            napTimer.stopTimer()
        } else {
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func updateLabelAndButton() {
        timeLabel.text = napTimer.timeLeftAsString()
        
        var buttonTitle = ""
        var buttonColor: UIColor = .black
        
        if napTimer.isOn {
            
            buttonTitle = "Stop"
            buttonColor = .red
        } else {
            buttonTitle = "Start"
            buttonColor = .green
        }
        
        timeButton.setTitle(buttonTitle, for: .normal)
        timeButton.setTitleColor(buttonColor, for: .normal)
    }
    
    func presentAlert() {
        
        //create alert controller
        
        let alertController = UIAlertController(title: "TIMES UP BITCH", message: "DONT BE A BETA WAKE UP", preferredStyle: .alert)
        
        //add textfield and actions
        
        alertController.addTextField { (textField) in
            
            textField.keyboardType = .numberPad
            textField.placeholder = "How many more seconds of sleep?"
        //present alert controller
    }
        
        let dismissAction = UIAlertAction(title: "IM AWAKE BITCH", style: .destructive, handler: nil)
        
        alertController.addAction(dismissAction)
        
        let snoozeAction = UIAlertAction(title: "SLEEP THEN HOE", style: .default) { (_) in
            
            if let textField = alertController.textFields?.first,
            
            let inputText = textField.text,
            
                let textAsDouble = Double(inputText) {
                
                self.napTimer.startTimer(textAsDouble)
                self.schedualeLocalAlert(in: textAsDouble)
                
        }
}
    
        alertController.addAction(dismissAction)
        alertController.addAction(snoozeAction)
        
        present(alertController, animated: true)
        
    }
    
    func schedualeLocalAlert(in timeInterval: TimeInterval) {
        
        let content = UNMutableNotificationContent()
        content.title = "Time's Up"
        content.body = "All the time is up"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        
        let request = UNNotificationRequest(identifier: "NapTimer", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("NOTIFICATION FAILED")
                print(error.localizedDescription)
                print(error)
                
            }
        }
    }
}
extension ViewController: NapTimerDelegate {
    func timerCompleted() {
        updateLabelAndButton()
    }
    
    func timerStopped() {
        updateLabelAndButton()
    }
    
    func timerSecondTicked() {
        updateLabelAndButton()
        presentAlert()
    }
    
}

