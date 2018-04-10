//
//  ShowProductViewController.swift
//  TrackHub
//
//  Created by Assumani, Medi on 3/30/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit
import Foundation

// MARK: PROTOCOLS
protocol ProductDataSenderDelegate: class {
    
    func sendData(productData: Product)
}

// MARK: CLASS
class ShowProductViewController: UIViewController {
    
    weak var delegate:ProductDataSenderDelegate? = nil
    
    //MARK: - @IBOULETS
    @IBOutlet weak var productNameLabel: UITextField!
    @IBOutlet weak var productBrandLabel: UITextField!
    @IBOutlet weak var productSizeLabel: UITextField!
    @IBOutlet weak var wholesalePriceLabel: UITextField!
    @IBOutlet weak var amazonPriceLabel: UITextField!
    @IBOutlet weak var sellingPriceLabel: UITextField!
    @IBOutlet weak var productCategoryLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
            // If the user clicks on the save button...
    @IBAction func saveButtonIsTapped(_ sender: Any) {
        
        
                    // Safely Unwrapping the optionals iboulets
        guard let name = productNameLabel.text, let brand = productBrandLabel.text, let size = productSizeLabel.text, let wholeSalePrice = wholesalePriceLabel.text?.convertSringToDouble(), let amazonPrice = amazonPriceLabel.text?.convertSringToDouble(), let sellingPrice = sellingPriceLabel.text?.convertSringToDouble(), let category = productCategoryLabel.text else {return}
        
                // If we have a delegate...
        if delegate != nil{
                    // create a product data to be sent when protocol is conformed
            let productData = Product()
            productData.productName = name
            productData.productBrand = brand
            productData.productSize = size
            productData.productWholesalePrice = wholeSalePrice
            productData.productProfit = productData.getProductProfit()
            productData.ProductPriceOnAmazon = amazonPrice
            productData.sellingPrice = sellingPrice
            productData.productCategory = category
            
                // sending the datato the VC that conforms the protocol
            delegate?.sendData(productData: productData)
        }
    }
    
    
}
