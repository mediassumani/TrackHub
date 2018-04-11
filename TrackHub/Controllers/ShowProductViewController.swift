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
    func sendData(productData: Product)
}

// MARK: CLASS
class ShowProductViewController: UIViewController {
    
    // MARK: Class Properties
    var delegate: ProductDataSenderDelegate?
    var product: Product?
    
    // MARK:  @IBOULETS
    @IBOutlet weak var productNameLabel: UITextField!
    @IBOutlet weak var productBrandLabel: UITextField!
    @IBOutlet weak var productSizeLabel: UITextField!
    @IBOutlet weak var wholesalePriceLabel: UITextField!
    @IBOutlet weak var amazonPriceLabel: UITextField!
    @IBOutlet weak var sellingPriceLabel: UITextField!
    @IBOutlet weak var productCategoryLabel: UITextField!
    
    // MARK: VIEWCONTROLLERS METHODS
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
    
    // MARK: SEGUE FUNCTIONS

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier, let destination = segue.destination as? MainMenuViewController else {return}
        switch segueIdentifier {
        
        // SAFELY UNWRAP THEM MEDI !!!
        case "save" where product != nil:
            product?.productName = productNameLabel.text ?? ""
            product?.productBrand = productBrandLabel.text ?? ""
            product?.productSize = productSizeLabel.text ?? ""
            product?.productCategory = productCategoryLabel.text ?? ""
            product?.productWholeSalePrice = (wholesalePriceLabel.text?.convertSringToDouble(wholesalePriceLabel.text))!
            product?.ProductPriceOnAmazon = (amazonPriceLabel.text?.convertSringToDouble(amazonPriceLabel.text))!
            product?.sellingPrice = (sellingPriceLabel.text?.convertSringToDouble(sellingPriceLabel.text))!
            
            destination.tableView.reloadData()
            
        case "save" where product == nil:
            
            let product = Product()
            product.productName = productNameLabel.text!
            product.productBrand = productBrandLabel.text!
            product.productSize = productSizeLabel.text!
            product.productCategory = productCategoryLabel.text!
            product.sellingPrice = (sellingPriceLabel.text?.convertSringToDouble(sellingPriceLabel.text))!
            product.productWholeSalePrice = (wholesalePriceLabel.text?.convertSringToDouble(wholesalePriceLabel.text))!
            product.ProductPriceOnAmazon = (amazonPriceLabel.text?.convertSringToDouble(amazonPriceLabel.text))!
            destination.userProducts.append(product)
            delegate?.sendData(productData: product)
        default:
            print("Unexpected identifier")
        }
    }
}
