//
//  ShowProductVC+Extension.swift
//  TrackHub
//
//  Created by Assumani, Medi on 4/22/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation
import UIKit

extension ShowProductViewController{
    
    
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
            product.setProductProfit(product.getProductProfit())
            product.setProductInvestment(product.productWholeSalePrice)
            destination.userProducts.append(product)
        default:
            print("Unexpected identifier")
        }
    }
}
