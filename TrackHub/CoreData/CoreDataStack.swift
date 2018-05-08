//
//  CoreDataStack.swift
//  TrackHub
//
//  Created by Assumani, Medi on 5/3/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack{
    static let sharedInstance = CoreDataStack()
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TrackHub")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
