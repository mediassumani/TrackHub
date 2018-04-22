//
//  ShowProductViewController.swift
//  TrackHub
//
//  Created by Assumani, Medi on 3/30/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit
import Foundation

class ShowProductViewController: UIViewController {
    
    // MARK: Class Properties
    var product: Product?
    
    // MARK:  @IBOULETS
    @IBOutlet weak var productNameLabel: UITextField!
    @IBOutlet weak var productBrandLabel: UITextField!
    @IBOutlet weak var productSizeLabel: UITextField!
    @IBOutlet weak var wholesalePriceLabel: UITextField!
    @IBOutlet weak var amazonPriceLabel: UITextField!
    @IBOutlet weak var sellingPriceLabel: UITextField!
    @IBOutlet weak var productCategoryLabel: UITextField!
    
    // MARK: VIEWCONTROLLERS LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = product?.productName
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let product = product{
            productNameLabel.text = product.productName
            productBrandLabel.text = product.productBrand
            productSizeLabel.text = product.productSize
            productCategoryLabel.text = product.productCategory
            wholesalePriceLabel.text = product.productWholeSalePrice.convertDoubleToString()
            amazonPriceLabel.text = product.ProductPriceOnAmazon.convertDoubleToString()
            sellingPriceLabel.text = product.sellingPrice.convertDoubleToString()
        }else{
            productNameLabel.text = ""
            productCategoryLabel.text = ""
            productSizeLabel.text = ""
            productBrandLabel.text = ""
            wholesalePriceLabel.text = ""
            amazonPriceLabel.text = ""
            sellingPriceLabel.text = ""
        }
    }
    
    // MARK: CLASS METHODS
    
    fileprivate func setProductImage(_ product: Product) -> UIImage{
        
        guard let productCategory = self.productCategoryLabel.text, var productImage = product.productImage else {return product.productImage!}
        
                // Assigning the correct image to the product
        switch productCategory{
        case "long Dress":
            productImage = UIImage(named: "longDress")!
            
        case "Short Dress":
            productImage = UIImage(named: "shortDress")!
            
        case "Sandals":
            productImage = UIImage(named: "sandals")!
            
        case "Pants":
            productImage = UIImage(named: "pants")!
            
        default:
            print("Invalid Choice")
        }
        
        return productImage
    }
    
}
