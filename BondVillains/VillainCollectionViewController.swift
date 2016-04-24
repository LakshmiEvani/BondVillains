//
//  VillainCollectionViewController.swift
//  BondVillains
//
//  Created by Souji on 4/23/16.
//  Copyright © 2016 Souji. All rights reserved.
//

import Foundation
import UIKit

class VillainCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    //TODO: Add outlet to flowLayout here.
    
    @IBOutlet var flowLayout: UICollectionViewFlowLayout!

    
    // Get ahold of some villains, for the table
    // This is an array of Villain instances
    let allVillains = Villain.allVillains
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Implement flowLayout here.
        flowLayOut()
       
    }
    
    
    func flowLayOut(){
        
        let space: CGFloat = 1.0
        let dimension = (view.frame.size.width - (2 * space)) / 2.0
        
        flowLayout?.minimumInteritemSpacing = space
         flowLayout?.minimumLineSpacing = space
        flowLayout?.itemSize = CGSizeMake(dimension, dimension)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = false
    }
    
    // MARK: Collection View Data Source
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allVillains.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("VillainCollectionViewCell", forIndexPath: indexPath) as! VillainCollectionViewCell
        let villain = self.allVillains[indexPath.row]
        
        // Set the name and image
        cell.nameLabel.text = villain.name
        cell.villainImageView?.image = UIImage(named: villain.imageName)
        //cell.schemeLabel.text = "Scheme: \(villain.evilScheme)"
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath:NSIndexPath)
    {
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("VillainDetailViewController") as! VillainDetailViewController
        detailController.villain = self.allVillains[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
}
