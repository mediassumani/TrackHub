//
//  MainMenuViewController.swift
//  TrackHub
//
//  Created by Assumani, Medi on 3/26/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit
import Foundation

class MainMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    // MARK: @IBOULETS
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor.white
    }
    
    // computed property - keeps track of all the client's products
    var userProducts = [Product]() {
        didSet {
            tableView.reloadData()
        }
    }


    // MARK: UITableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.mainMenuCellIdentifier, for: indexPath) as! ProductCell
        let product = userProducts[indexPath.row]
        cell.productNameLabel.text = product.productName
        cell.productProfitLabel.text = "$" + product.getProductProfit().convertDoubleToString()
        cell.productImage.image = UIImage(named: "noImage")
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        
        switch identifier{
        case "showProduct":
            
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let product = userProducts[indexPath.row]
            let destination = segue.destination as! ShowProductViewController
            destination.product = product
            
        case "addProduct":
            print("adding product")
        default:
            print("Unverified identifier")
        }
    }
    
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue){
        // empty for now
    }
  
}

