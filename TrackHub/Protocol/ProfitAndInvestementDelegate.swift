//
//  ProfitAndInvestementDelegate.swift
//  TrackHub
//
//  Created by Assumani, Medi on 4/13/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation

@objc protocol ProfitAndInvestementDelegate: class{
    @objc optional func sendTotalProfitData(totalprofit: Double)
    @objc optional func sendTotalInvestmentData(totalInvenstement: Double)
}
