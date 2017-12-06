//
//  ContactCellCollectionViewCell.swift
//  ContactsAppProject
//
//  Created by Emmanuelle TERMEAU on 12/6/17.
//  Copyright © 2017 Emmanuelle TERMEAU. All rights reserved.
//

import UIKit

class ContactCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var contactImg: UIImageView! {
        didSet {
            
        }
    }
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    var contact : Contact? {
        didSet{
            self.usernameLabel.text = contact?.username
        }
    }
}
