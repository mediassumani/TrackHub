//
//  ProfitAndInvestementDelegate.swift
//  TrackHub
//
//  Created by Assumani, Medi on 4/13/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation
/*
    This protocol contains two optional important functions for the TotalInvestment and TotalProfit ViewControllers.
 
 */
@objc protocol ProfitAndInvestementDelegate: class{
    @objc optional func sendTotalProfitData(_ totalprofit: Double) //  passes the total investment of all products
    @objc optional func sendTotalInvestmentData(_ totalInvenstement: Double) //  passes the total profit of all products
}
