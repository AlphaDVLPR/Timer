//
//  ViewController.swift
//  Timer
//
//  Created by AlphaDVLPR on 8/6/19.
//  Copyright © 2019 AlphaDVLPR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeButton: UIButton!
    
    var napTimer = NapTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NapTimer
        // Do any additional setup after loading the view.
    }
    

    @IBAction func timeButtonTapper(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
