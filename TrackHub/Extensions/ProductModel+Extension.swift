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

    // extending the Product Entity to add custom methods

extension Product {
    
    static let sharedInstance = Product()
    
    // Instance Method - This function sets the current total profit after the stored variables have been initialized
    func setProductProfit(_ profit: Double){
        self.totalProfit = profit
    }
    
    // Instance Method - This function sets the current total money invested in the specific merchandise
    func setProductInvestment(_ investement: Double){
        self.totalInvestment = investement
    }
    
    // Instance Method - returns the profit made off a specific merchandise
    internal func getProductProfit() -> Double{
        return sellingPrice - productWholeSalePrice
    }
    
    // Instance Method - returns the invested money on one merchandise
    internal func getProductInvestementAmount() -> Double{
        return self.productWholeSalePrice
    }
    
    // Instance Method - returns the total profit off of all the merchandise
    static func getAllProfit()-> Double{
        
        let listOfProducts: [Product] = CoreDataHelper.fetchAllProducts()
        return listOfProducts.map{$0.getProductProfit()}.reduce(0.0,+)
    }
    
    // Instance Method - returns the total invested money off of all the merchandise
    static func getAllInvestment() -> Double{
        let listOfProducts: [Product] = CoreDataHelper.fetchAllProducts()
        return  listOfProducts.map{$0.getProductInvestementAmount()}.reduce(0.0,+)
    }
}
