//
//  MainMenuVC+Extension.swift
//  TrackHub
//
//  Created by Assumani, Medi on 4/13/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation
import UIKit

extension MainMenuViewController: UITableViewDataSource, UITableViewDelegate{
    
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
        cell.productImage.image = product.productImage
        return cell
    }
    
    // function to remove a product from the main menu and from the array
    func tableView(_ tableview : UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            let productToBeDeleted = userProducts[indexPath.row]
        }
    }
}

