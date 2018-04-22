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
    
        // Function to save a product instance into the coredata store
    static func saveProduct(){
        do{
            try objectContext.save()
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
        /* Funtion to delete a product instance from the coredata store
        param - productToBeDeleted : an instance of type Product to be removed from the list of client's products
        */
    static func deleteProduct(_ productToBeDeleted: Product){
        objectContext.delete(productToBeDeleted)
        saveProduct()
    }
    
    // Funxtion to fetch/grab all of the client's products and return them in an Array
    static func fetchAllProduct() -> [Product]{
        return []
    }
    
}
