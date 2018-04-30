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
    
    // MARK: PROPERTIES
    var product: Product?
    let listOfPruductCategories: [String] = ["Long Dress","Short Dress","Sandal","Pant","Lady Top"]
    var pickerView = UIPickerView() // will hold all the product category choices
    
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
        self.pickerView.delegate = self as UIPickerViewDelegate
        self.pickerView.dataSource = self as UIPickerViewDataSource
        productCategoryLabel.inputView = pickerView
        self.productNameLabel.delegate = self as UITextFieldDelegate
        self.productSizeLabel.delegate = self as UITextFieldDelegate
        self.productCategoryLabel.delegate = self as UITextFieldDelegate
        self.productBrandLabel.delegate = self as UITextFieldDelegate
        self.wholesalePriceLabel.delegate = self as UITextFieldDelegate
        self.amazonPriceLabel.delegate = self as UITextFieldDelegate
        self.sellingPriceLabel.delegate = self as UITextFieldDelegate
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let product = product{
            productNameLabel.text = product.productName
            productBrandLabel.text = product.productBrand
            productSizeLabel.text = product.productSize
            productCategoryLabel.text = product.productCategory
            wholesalePriceLabel.text = product.productWholeSalePrice.convertDoubleToString()
            amazonPriceLabel.text = product.productPriceOnAmazon.convertDoubleToString()
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

    internal func setProductImage(_ product: Product) -> UIImage{

        var productImage: UIImage?
                // Assigning the correct image to the product
        let pickerValue = listOfPruductCategories[pickerView.selectedRow(inComponent: 0)]
            if pickerValue == "Long Dress"{
                productImage = UIImage(named: "longDress")
            }else if pickerValue == "Short Dress"{
                productImage = UIImage(named: "shortDress")
            }else if pickerValue == "Pant" {
                productImage = UIImage(named: "pants")
            }else if pickerValue == "Sandal" {
                productImage = UIImage(named: "sandals")
            } else if pickerValue == "Lady Top"{
                productImage = UIImage(named: "ladyTop")
            }else{
                productImage = UIImage(named: "noImage")
            }
        return productImage!
    }
}
