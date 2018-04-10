//
//  MainMenuViewController.swift
//  TrackHub
//
//  Created by Assumani, Medi on 3/26/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit
import Foundation

class MainMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //-MARK : @IBOULETS
    
    @IBOutlet weak var tableView: UITableView!
    
    //-MARK : PROPERTIES
    var userProducts = [Product](){
        didSet {
           tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor.white
    }

    // - MARK : UITableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.mainMenuCellIdentifier, for: indexPath) as! ProductCell
        let product = userProducts[indexPath.row]
        cell.productNameLabel.text = product.productName
        cell.productProfitLabel.text = product.getProductProfit().convertDoubleToString()
        cell.productImage.image = UIImage(named: "noImage")
        return cell
    }
    
    
    // - MARK : SEGUE METHODS
    
    
    /*
     This function prevents the navigation from VC's to cause memmory leaks
     - parameter segue : The segue to the destination VC
     */
    @IBAction func unwindWithSegue(_ segue : UIStoryboardSegue){
        // empty for now
    }
    

    
}
