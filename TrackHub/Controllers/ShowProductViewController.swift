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
    func sendData(_ controller: ShowProductViewController, productData: Product)
}

// MARK: CLASS
class ShowProductViewController: UIViewController {
    
    var delegate: ProductDataSenderDelegate?
    //MARK:  @IBOULETS
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
    
    func createProductObject() -> Product{
        
        var productData = Product()
        
        // create a product data to be sent when protocol is conformed
        productData.productName = productNameLabel.text!
        productData.productBrand = productBrandLabel.text!
        productData.productSize = productSizeLabel.text!
        productData.productWholeSalePrice = (wholesalePriceLabel.text?.convertSringToDouble(wholesalePriceLabel.text))!
        productData.productProfit = (productData.getProductProfit())
        productData.ProductPriceOnAmazon = (amazonPriceLabel.text?.convertSringToDouble(amazonPriceLabel.text)!)!
        productData.sellingPrice = (sellingPriceLabel.text?.convertSringToDouble(sellingPriceLabel.text)!)!
        productData.productCategory = productCategoryLabel.text!
        
        return productData
    }
            // If the user clicks on the save button...
    @IBAction func saveButtonIsTapped(_ sender: Any) {
        let data: Product = createProductObject()
        print(data.productProfit)
    }
    
    
}
