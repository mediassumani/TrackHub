//
//  MainMenuViewController.swift
//  TrackHub
//
//  Created by Assumani, Medi on 3/26/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit
import Foundation

class MainMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ProductDataSenderDelegate {
    // MARK: @IBOULETS
    
    @IBOutlet weak var tableView: UITableView!
    
    // computed property - keeps track of all the client's products
    var userProducts = [Product](){
        didSet{
            // if there is any update on the list of books...the tableview updates
            tableView.reloadData()
        }
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor.white
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let nav = segue.destination as? UINavigationController, let sendingVC = nav.topViewController as? ShowProductViewController{
            sendingVC.delegate = self as? ProductDataSenderDelegate
        }
    }
    
    func sendData(_ productData: Product?) {
        guard let unwrappedProductData = productData else {return}
        self.userProducts.append(unwrappedProductData)
    }
    

    // MARK: UITableView Methods
    
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
  
    
    /*
     This function prevents the navigation from VC's to cause memmory leaks
     - parameter segue : The segue to the destination VC
     */
    @IBAction func unwindWithSegue(_ segue : UIStoryboardSegue){
        // empty for now
    }
    
}
