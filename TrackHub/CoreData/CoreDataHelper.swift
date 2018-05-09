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
    // Function to craete a new product instance and insert it into the coreData store

    static var SharedProduct = Product()
    static let persistentContainer: NSPersistentContainer = CoreDataStack.sharedInstance.persistentContainer
    static let objectContext: NSManagedObjectContext = persistentContainer.viewContext
    
    static func createNewProduct() -> Product{
        let newProduct = NSEntityDescription.insertNewObject(forEntityName: "Product", into: objectContext) as! Product
        return newProduct
    }
     // Function to save a product instance into the coredata store
    static func saveProduct(){
        do{
            try objectContext.save()
        } catch let error {
            print("Error Found : \(error.localizedDescription)")
        }
    }
    // Function to delete a product from the client's list of products
    static func deleteProductFromTheInventory(_ product: Product){
        objectContext.delete(product as NSManagedObject)
        saveProduct()
    }
    // Function to retreive all of the client's products in a list
    static func fetchAllProducts() -> [Product]{
        do{
            let fetchRequest = NSFetchRequest<Product>(entityName: "Product")
            let fetchResult = try objectContext.fetch(fetchRequest)
            
            return fetchResult
        }catch let error {
            print("Error Found: \(error.localizedDescription)")
            return []
        }
    }
}
