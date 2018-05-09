//
//  TotalInvestmentMade.swift
//  TrackHub
//
//  Created by Assumani, Medi on 3/26/18.Pr
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit
import Foundation
/*
    This view controller displays the Total money invested by the user based on the products
    data that were entred.
 */

class TotalInvestmentMade: UIViewController {
    
    @IBOutlet weak var totalInvestmentLabel: UILabel!
    //var investment = Product.sharedInstance.totalInvestment
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        totalInvestmentLabel.text = "$\(Product.getAllInvestment())"
    }
}

