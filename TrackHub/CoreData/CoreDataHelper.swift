//
//  CoreDataHelper.swift
//  TrackHub
//
//  Created by Assumani, Medi on 4/13/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import CoreData
import UIKit

struct CoreDataHelper{
    static let objectContext: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            fatalError()
        }
            // Getting the persitant container property from the AppDelegate file
        let persistantConatainer = appDelegate.persistentContainer
        let context = persistantConatainer.viewContext
        
        return context
    }()
    
    // IMPORTANT METHODS
    
        // Function to craete a new product instance and insert it into the coreData store
    static func createNewProduct() -> Product{
        let newProduct = NSEntityDescription.insertNewObject(forEntityName: "Product", into: objectContext)
        return newProduct
    }
}
