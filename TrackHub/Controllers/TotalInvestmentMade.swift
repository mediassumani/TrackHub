//
//  TotalInvestmentMade.swift
//  TrackHub
//
//  Created by Assumani, Medi on 3/26/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit

class TotalInvestmentMade: UIViewController {

    @IBOutlet weak var greetingView: UITextView!
    @IBOutlet weak var investmentLabel: UILabel!
    @IBOutlet weak var investmentText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TimeHelper.singleton.displayGreeting(greetingTextView: greetingView)
        investmentText.text = "Total Investment : "
    }
    
    override func viewWillAppear(_ animated: Bool) {
        investmentLabel.text = "$" + Product.totalInvestment.convertDoubleToString()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
