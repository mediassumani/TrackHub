//
//  TotalProfitViewController.swift
//  TrackHub
//
//  Created by Assumani, Medi on 3/26/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit

 // This view controller displays the Total profit made by every products that were created
class TotalProfitViewController: UIViewController{
    
    let stack = CoreDataStack.sharedInstance
    var product = [Product]()
    
    @IBOutlet weak var profitAmountLabel: UILabel!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override public func viewWillAppear(_ animated: Bool) {
      profitAmountLabel.text = "$ \(Product.getAllProfit())"
    }
}
