//
//  Product.swift
//  TrackHub
//
//  Created by Assumani, Medi on 4/1/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation
import UIKit

public class Product{
    // single property to keep track of the totalamount invested
    static var totalInvestment: Double = 0.0
    
    // Stored propertis
    var productName: String = ""
    var productBrand: String = ""
    var productSize: String = "" // size can be set as XL, L, M, S
    var productWholesalePrice: Double = 0.0
    var productProfit: Double = 0.0
    var ProductPriceOnAmazon: Double = 0.0
    var sellingPrice: Double = 0.0
    var productCategory: String = ""
    
    // Custom initializer - doesn't take any parameter
    init() {
        // Increments the total investement each time a product is created
       Product.totalInvestment += sellingPrice
    }
    // Instance Method - returns the profit made off the merchandise
    public func getProductProfit() -> Double{
        
        self.productProfit = sellingPrice - productWholesalePrice
        return productProfit
    }
    
}


