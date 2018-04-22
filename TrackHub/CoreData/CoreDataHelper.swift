//
//  CoreDataHelper.swift
//  TrackHub
//
//  Created by Assumani, Medi on 4/13/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation
import UIKit

struct CoreDataHelper{
    static let managedObjejctContext: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            fatalError()
        }
        
    }()
}
