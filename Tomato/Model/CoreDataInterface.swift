//
//  File.swift
//  Tomato
//
//  Created by Vicente Simões on 09/11/2018.
//  Copyright © 2018 Vicente Simões. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataInterface {
    
    static let shared = CoreDataInterface()
    
    enum InteractionType {
        // CRUD operations
        case toggleOn
        case toggleOff
        case fetch
    }
    
    enum InteractionError: Error {
        case CoreDataInteractionException
    }
    // interact method is the interface the model uses to speak with CoreData
    func interact(withUseCase useCase: InteractionType,
                  withId resId: Int? = nil) throws -> [Int]  {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else { throw InteractionError.CoreDataInteractionException }
        
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Favourite", in: context)
        
        // all cases will return a read to update the favourite list
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favourite")
        request.returnsObjectsAsFaults = false
        
        switch useCase {
            
        case .toggleOn:
            
            let newFavourite = NSManagedObject(entity: entity!, insertInto: context)
            newFavourite.setValue( resId, forKey: "restaurantId")
            do { try context.save() } catch { print("Could not save addition to Core Data") }
            
        case .toggleOff:
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favourite")
            let results: [NSManagedObject] = try context.fetch(request) as! [NSManagedObject]
            results.forEach {
                if ($0.value(forKey: "restaurantId") as! Int) == resId {
                    context.delete($0)
                }
            }
            do { try context.save() } catch { print("Could not save deletion to Core Data") }
            
        case .fetch:
            break
        }
        
        return try self.readObjects(fromRequest: request, context: context)
    }
    
    func readObjects(fromRequest request: NSFetchRequest<NSFetchRequestResult>,
                     context: NSManagedObjectContext) throws -> [Int] {
        
        var results: [NSManagedObject] = []
        do {
            let result = try context.fetch(request)
            results = result as! [NSManagedObject]
        } catch {
            print("Failed fetching data from Core Data")
            throw InteractionError.CoreDataInteractionException
        }
        return results.map { $0.value(forKey: "restaurantId") as! Int }
    }
}
