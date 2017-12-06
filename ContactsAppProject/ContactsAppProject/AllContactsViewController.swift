//
//  AllContactsViewController.swift
//  ContactsAppProject
//
//  Created by Emmanuelle TERMEAU on 12/6/17.
//  Copyright © 2017 Emmanuelle TERMEAU. All rights reserved.
//

import UIKit
import CoreData

class AllContactsViewController: UIViewController{
    
    var contactManager : ContactManager?

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {

        if (contactManager != nil ) {
            contactManager?.getDB()
        }

        super.viewDidLoad()
        collectionView.reloadData()
        contactManager?.loadDB()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadData()
    }

    func collectionView(_ collectionView : UICollectionView, numberOfRowsInSection section : Int) -> Int {
        return (contactManager?.contacts.count)!
    }
    
    func collectionView(_ collectionView : UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contactCell", for: indexPath) as! ContactCollectionViewCell
        cell.contact = self.contactManager?.contacts[indexPath.row]
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
