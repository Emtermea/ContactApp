//
//  ContactManager.swift
//  ContactsAppProject
//
//  Created by Emmanuelle TERMEAU on 12/6/17.
//  Copyright © 2017 Emmanuelle TERMEAU. All rights reserved.
//


import UIKit
import CoreData



class ContactManager: NSObject {

    var contacts : [Contact] = []
    var me : Contact?
    
    let urlDB = "http://www.storage42.com/contacts.json"
    
    var context : NSManagedObjectContext? {
        didSet {
            self.loadDB()
        }
    }
    
    override init() {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            context = delegate.persistentContainer.viewContext as NSManagedObjectContext
        } else {
            print ("can't get context")
        }
    }
    
    func loadDB() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
        request.returnsObjectsAsFaults = false
        do {
            let results = try self.context?.fetch(request)
            if (results?.count)! > 0 {
                for result in results! {
                    print ("result in loadDb() ", result)
                    if let newContact = result as? Contact {
                        self.contacts.append(newContact)
                    }
                }
            }
        } catch {
            print ("an error occurred from DB context")
        }
    }
    
    func addContact (newContact : NSDictionary? ) {
        if newContact == nil {
            print("invalid contact")
            return
        }
        let contact : Contact = NSEntityDescription.insertNewObject(forEntityName: "Contact", into: context!) as! Contact
        print ("contact add : " , contact)
        
//        contact.setValue(3, forKey: "gender")
////        contact.setValue(1, forKey: "<#T##String#>")
////        contact.setValue(2, forKey: "location")
//        contact.setValue(2, forKey: "email")
//        contact.setValue(9, forKey: "username")
//        contact.setValue(6, forKey: "password")
//        contact.setValue(7, forKey: "phone")
//        contact.setValue(1, forKey: "cell")
//        contact.setValue(picture, forKey: "picture")
        
    }
    
    func getDB() {
        do {
            let url = URL.init(string: self.urlDB)
            if let data = try? Data(contentsOf: url!) {
                if let dic: NSDictionary = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let contactsTab = dic["contacts"] as? NSArray {
                        print(contactsTab)
                        _ = contactsTab.map { self.addContact(newContact: $0 as? NSDictionary) }
                        do{
                            try context?.save()
                            print ("data saved")
                            self.loadDB()
                        }catch{
                            let nserror = error as NSError
                            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                        }
                    }
                }
            } else {
                print("Error get data")
            }
        }
    }
    
    func randomText(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        var randString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randString += NSString(characters: &nextChar, length: 1) as String
        }
        return randString
    }
}
