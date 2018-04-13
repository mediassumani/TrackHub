//
//  TotalProfitViewController.swift
//  TrackHub
//
//  Created by Assumani, Medi on 3/26/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit

public class TotalProfitViewController: UIViewController, ProductDataSenderDelegate {

    // - MARK : @IBOULETS
    
    @IBOutlet weak var greetingView: UITextView!
    @IBOutlet weak var profitAmountLabel: UILabel!
    
    // - VIEW CONTROLLER METHODS
    override public func viewDidLoad() {
        super.viewDidLoad()
        TimeHelper.singleton.displayGreeting(greetingTextView: greetingView)
        // Do any additional setup after loading the view.
    }
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nav = segue.destination as? UINavigationController, let sendingVC = nav.topViewController as? ShowProductViewController  {
            sendingVC.delegate = self
        }
    }

    func sendData(productData: Product) {
        self.profitAmountLabel.text = productData.getProductProfit().convertDoubleToString()
    }
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
