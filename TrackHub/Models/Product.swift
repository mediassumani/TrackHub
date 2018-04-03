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
    
    private var productName: String = ""
    private var productBrand: String = ""
    private var productSize: Int = 0
    private var wholesalePrice: Double = 0.0
    private var productProfit: Double = 0.0
    private var priceOnAmazon: Double = 0.0
    private var priceOnExpress: Double = 0.0
    private var suggestedSellingPrice: Double = 0.0
    private var category: ProductCategory = .dress // default value
    private var image: UIImage
}
