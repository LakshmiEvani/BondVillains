//
//  VillainDetailViewController.swift
//  BondVillains
//
//  Created by Souji on 4/21/16.
//  Copyright © 2016 Souji. All rights reserved.
//

import Foundation
import UIKit

class VillainDetailViewController : UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var villain: Villain!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.label.text = self.villain.name
        
        self.imageView!.image = UIImage(named: villain.imageName)
    }

    
    
}


    
   