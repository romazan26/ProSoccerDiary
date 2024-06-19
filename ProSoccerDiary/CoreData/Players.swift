//
//  Players+CoreDataProperties.swift
//
//
//  Created by Роман on 19.06.2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import UIKit

@objc(Players)
public class Players: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Players> {
        return NSFetchRequest<Players>(entityName: "Players")
    }

    @NSManaged public var age: String?
    @NSManaged public var image: UIImage?
    @NSManaged public var name: String?
    @NSManaged public var team: String?

}

extension Players : Identifiable {

}
