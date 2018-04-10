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
    
    static var totalInvestment: Double = 0.0
    var productName: String = ""
    var productBrand: String = ""
    var productSize: String = ""
    var productWholesalePrice: Double = 0.0
    var productProfit: Double = 0.0
    var ProductPriceOnAmazon: Double = 0.0
    var sellingPrice: Double = 0.0
    var productCategory: String = ""
    
    init() {
       Product.totalInvestment += sellingPrice
    }
    
    public func getProductProfit() -> Double{
        
        self.productProfit = sellingPrice - productWholesalePrice
        return productProfit
    }
    
}


