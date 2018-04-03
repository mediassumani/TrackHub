//
//  TotalProfitViewController.swift
//  TrackHub
//
//  Created by Assumani, Medi on 3/26/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit

class TotalProfitViewController: UIViewController {

    // - MARK : @IBOULETS
    
    @IBOutlet weak var greetingView: UITextView!
    @IBOutlet weak var profitAmountLabel: UILabel!
    
    // - VIEW CONTROLLER METHODS
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // CLASS METHODS
    fileprivate func displayGreeting(textView: UITextView, currentTime: NSDate){
        
    }
    
    fileprivate func timeIsMorning(){
        
    }
    
    fileprivate func timeIsEvening(){
        
    }
    
    fileprivate func timeIsNight(){
        
    }
}
