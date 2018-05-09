//
//  TotalProfitViewController.swift
//  TrackHub
//
//  Created by Assumani, Medi on 3/26/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit

public class TotalProfitViewController: UIViewController{
    
    let stack = CoreDataStack.sharedInstance
    var product = [Product]()
    
    @IBOutlet weak var profitAmountLabel: UILabel!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        /*product = {
           return CoreDataHelper.fetchAllProducts()
        }()
 */
    }
    
    override public func viewWillAppear(_ animated: Bool) {
      profitAmountLabel.text = "$ \(Product.getAllProfit())"
    }
}
