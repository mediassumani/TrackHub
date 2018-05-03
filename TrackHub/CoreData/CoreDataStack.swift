//
//  CoreDataStack.swift
//  TrackHub
//
//  Created by Assumani, Medi on 5/3/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation
import CoreData

struct CoreDataStack{
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TrackHub")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
        
}
