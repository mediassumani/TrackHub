//
//  MainMenuViewController.swift
//  TrackHub
//
//  Created by Assumani, Medi on 3/26/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit
import Foundation

class MainMenuViewController: UIViewController{
    
    // MARK: @IBOULETS
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: PROPERTIES
    let listOfPruductCategories: [String] = ["Long Dress","Short Dress","Sandal","Pant"]
    var pickerView = UIPickerView() // will hold all the product category choices
    
    var userProducts = [Product]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: @IBACTIONS
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue){
        // empty for now
    }
    
    // MARK: VIEW CONTROLLER LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.white
    }

    // MARK: SEGUES METHODS
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
}

