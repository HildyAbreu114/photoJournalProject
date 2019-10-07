//
//  photoCell.swift
//  photoJournal
//
//  Created by hildy abreu on 10/7/19.
//  Copyright © 2019 hildy abreu. All rights reserved.
//

import UIKit

class photoCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var optionsButton: UIButton!
    
    @IBOutlet weak var photoDescriptionLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var buttonFunction: (()->Void)?
    
    
    
    

    @IBAction func optionsButtonPressed(_ sender: UIButton) {
        if let closure = buttonFunction {
            closure()
        }
    }
    
    
    
    
}
