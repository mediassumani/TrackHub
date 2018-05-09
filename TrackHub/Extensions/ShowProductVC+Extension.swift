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
            product?.productPriceOnAmazon = (amazonPriceLabel.text?.convertSringToDouble(amazonPriceLabel.text))!
            product?.sellingPrice = (sellingPriceLabel.text?.convertSringToDouble(sellingPriceLabel.text))!

            destination.tableView.reloadData()
            CoreDataHelper.saveProduct()
       
        case "save" where product == nil:
            
            let product: Product = CoreDataHelper.createNewProduct()
            product.productName = productNameLabel.text
            product.productBrand = productBrandLabel.text
            product.productSize = productSizeLabel.text
            product.productCategory = productCategoryLabel.text!
            product.sellingPrice = (sellingPriceLabel.text?.convertSringToDouble(sellingPriceLabel.text))!
            product.productWholeSalePrice = (wholesalePriceLabel.text?.convertSringToDouble(wholesalePriceLabel.text))!
            product.productPriceOnAmazon = (amazonPriceLabel.text?.convertSringToDouble(amazonPriceLabel.text))!
            product.productImage = setProductImage(product)
            product.setProductProfit(product.getProductProfit())
            product.setProductInvestment(product.productWholeSalePrice)
            destination.userProducts.append(product)
            CoreDataHelper.saveProduct()
        default:
            print("Unexpected identifier")
        }
    }
}

            // SETTING UP THE PRODUCT CATEGORY PICKER CHOICE

extension ShowProductViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    // returns the number of 'columns' to display.
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    // returns the # of rows in each component..
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return self.listOfPruductCategories.count
    }
    
    // Returns the text to be shown on each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listOfPruductCategories[row]
    }

}
        // SETTING UP THE TEXTFIELDS IN THE VC
extension ShowProductViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case productNameLabel:
            productBrandLabel.becomeFirstResponder()
        case productBrandLabel:
            productSizeLabel.becomeFirstResponder()
        case productSizeLabel:
            wholesalePriceLabel.becomeFirstResponder()
        case wholesalePriceLabel:
            amazonPriceLabel.becomeFirstResponder()
        case amazonPriceLabel:
            sellingPriceLabel.becomeFirstResponder()
        case sellingPriceLabel:
            productCategoryLabel.becomeFirstResponder()
        default:
            productCategoryLabel.resignFirstResponder()
        }
        return true
    }
}
