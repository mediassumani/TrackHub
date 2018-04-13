//
//  TotalProfitViewController.swift
//  TrackHub
//
//  Created by Assumani, Medi on 3/26/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit

public class TotalProfitViewController: UIViewController{

    // - MARK : @IBOULETS
    
    @IBOutlet weak var greetingView: UITextView!
    @IBOutlet weak var profitAmountLabel: UILabel!
    
    // - VIEW CONTROLLER METHODS
    override public func viewDidLoad() {
        super.viewDidLoad()
        TimeHelper.singleton.displayGreeting(greetingTextView: greetingView)
        // Do any additional setup after loading the view.
    }
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
