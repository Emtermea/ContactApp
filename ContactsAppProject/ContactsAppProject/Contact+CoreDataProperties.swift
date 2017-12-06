//
//  Contact+CoreDataProperties.swift
//  ContactsAppProject
//
//  Created by Emmanuelle TERMEAU on 12/6/17.
//  Copyright © 2017 Emmanuelle TERMEAU. All rights reserved.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?
    @NSManaged public var name: String?
    @NSManaged public var gender: String?
    @NSManaged public var location: String?
    @NSManaged public var email: String?
    @NSManaged public var phone: String?
    @NSManaged public var cell: String?
//    @NSManaged public var image: NSData?
//    @NSManaged public var imgUrl: String?
//    @NSManaged public var name: String?

}
