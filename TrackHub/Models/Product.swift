//
//  Product.swift
//  TrackHub
//
//  Created by Assumani, Medi on 4/1/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation

public final class Product{
    // single property to keep track of the total amount invested and total profit
    static public var totalInvestment = 0.0
    static public var totalProfit = 0.0
    
    // Stored propertis
    var productName: String = ""
    var productBrand: String = ""
    var productSize : String = "" // size can be set as XL, L, M, S
    var productWholeSalePrice: Double = 0.0
    var ProductPriceOnAmazon: Double = 0.0
    var sellingPrice: Double = 0.0
    var productCategory: String = ""
    
    // Instance Method - This function sets the current total profit after the stored variables have been initialized
    func setProductProfit(_ profit: Double){
        Product.totalProfit  += profit
    }
    
    // Instance Method - This function sets the current total money invested in the specific merchandise
    func setProductInvestment(_ investement: Double){
        Product.totalInvestment += investement
    }
    
    // Instance Method - returns the profit made off a specific merchandise
    internal func getProductProfit() -> Double{
        return sellingPrice - productWholeSalePrice
    }
    
    // Instance Method - returns the invested money on the merchandise
    internal func getProductInvestementAmount() -> Double{
        return self.productWholeSalePrice
    }
}


