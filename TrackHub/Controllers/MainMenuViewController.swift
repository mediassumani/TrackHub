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
    var userProducts = [Product](){
        didSet{
            // if there is any update on the list of books...the tableview updates
            tableView.reloadData()
        }
    }

    

    // MARK: UITableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.mainMenuCellIdentifier, for: indexPath) as! ProductCell
        
        //let product = userProducts[indexPath.row]
        cell.productNameLabel.text = "productName"
        cell.productProfitLabel.text = "$14"
        cell.productImage.image = UIImage(named: "noImage")
        return cell
    }
  
}
