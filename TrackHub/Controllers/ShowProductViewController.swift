//
//  ShowProductViewController.swift
//  TrackHub
//
//  Created by Assumani, Medi on 3/30/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit
import Foundation

// MARK: Protocol
protocol ProductDataSenderDelegate: class {
    
    func sendData(_ productData: Product?)
}

// MARK: CLASS
class ShowProductViewController: UIViewController {
    
    weak var delegate: ProductDataSenderDelegate?
    
    //MARK:  @IBOULETS
    @IBOutlet weak var productNameLabel: UITextField!
    @IBOutlet weak var productBrandLabel: UITextField!
    @IBOutlet weak var productSizeLabel: UITextField!
    @IBOutlet weak var wholesalePriceLabel: UITextField!
    @IBOutlet weak var amazonPriceLabel: UITextField!
    @IBOutlet weak var sellingPriceLabel: UITextField!
    @IBOutlet weak var productCategoryLabel: UITextField!
    
    var productData: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Safely Unwrapping the optionals iboulets
        guard let name = productNameLabel.text, let brand = productBrandLabel.text, let size = productSizeLabel.text, let wholeSalePrice = wholesalePriceLabel.text?.convertSringToDouble(wholesalePriceLabel.text), let amazonPrice = amazonPriceLabel.text?.convertSringToDouble(amazonPriceLabel.text), let sellingPrice = sellingPriceLabel.text?.convertSringToDouble(sellingPriceLabel.text), let category = productCategoryLabel.text else {return}
        
        // create a product data to be sent when protocol is conformed
        productData?.productName = name
        productData?.productBrand = brand
        productData?.productSize = size
        productData?.productWholesalePrice = wholeSalePrice
        productData?.productProfit = (productData?.getProductProfit())!
        productData?.ProductPriceOnAmazon = amazonPrice
        productData?.sellingPrice = sellingPrice
        productData?.productCategory = category
        
    }
            // If the user clicks on the save button...
    @IBAction func saveButtonIsTapped(_ sender: Any) {
        
            // sending the datato the VC that conforms the protocol
        guard let myDelegate = self.delegate else {return}
        myDelegate.sendData(productData)
            //dismiss(animated: true, completion: nil
    }
    
    
}
