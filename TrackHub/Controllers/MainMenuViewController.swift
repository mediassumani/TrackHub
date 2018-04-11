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
    
    // MARK: @IBOULETS And Properties
    @IBOutlet weak var tableView: UITableView!
    var userProducts = [Product]() {
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
    


    // MARK:  DATA SOURCE METHODS
    
            // Function to keep track of the amount of cells in the main menu
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userProducts.count
    }
            // Function to fill up each table view cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.mainMenuCellIdentifier, for: indexPath) as! ProductCell
        let product = userProducts[indexPath.row]
        cell.productNameLabel.text = product.productName
        cell.productProfitLabel.text = "$" + product.getProductProfit().convertDoubleToString()
        cell.productImage.image = UIImage(named: "noImage")
        return cell
    }
    
            // function to remove a product from the main menu and from the array
    func tableView(_ tableview : UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            userProducts.remove(at: indexPath.row)
        }
    }
    
    // MARK: SEGUES FUNCTIONS
    
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

