//
//  ProductModel+Extension.swift
//  TrackHub
//
//  Created by Assumani, Medi on 4/29/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension Product{
    
    
    // Single properties to keep track of the total investment and profit
    
    static public var totalInvestment = 0.0
    static public var totalProfit = 0.0
    
    // Stored properties
    @NSManaged var productName: String
    @NSManaged var productBrand: String
    @NSManaged var productSize: String
    @NSManaged var productWholeSalePrice: Double
    @NSManaged var productPriceOnAmazon: Double
    @NSManaged var sellingPrice: Double
    @NSManaged var productCategory: String
    @NSManaged var productImage: UIImage
    
    
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

