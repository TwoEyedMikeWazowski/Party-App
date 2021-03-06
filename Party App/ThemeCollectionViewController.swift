//
//  ThemeCollectionViewController.swift
//  Party App
//
//  Created by Daniel on 4/8/18.
//  Copyright © 2018 Placeholder Interactive. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ThemeCell"

class ThemeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    struct FaceTheme {
        var title: String
        var themeImage: String
        var faces: [String]
    }
    
    let faceThemes = [
        FaceTheme(title: "Tinkertanker", themeImage: "tinkertanker", faces: ["yjface", "jamesface"]),
        FaceTheme(title: "Presidents", themeImage: "presidents", faces: ["trump", "obama"]),
        FaceTheme(title: "Elderly", themeImage: "elderly", faces: ["harold", "gran"])
                       ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "chooseTheme" {
            let destination = segue.destination as! EmojiViewController
            // Worse method
    /*        let selectedIndexPath = collectionView?.indexPathsForSelectedItems?[0]
            destination.faces = faceThemes[(selectedIndexPath?.item)!].faces */
            
            // Better method
            if let cell = sender as? ThemeCollectionViewCell {
                if let indexPath = collectionView?.indexPath(for: cell) {
                    destination.faces = faceThemes[indexPath.item].faces
                }
            }
        }
    }
 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return faceThemes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ThemeCollectionViewCell

        cell.titleLabel.text = faceThemes[indexPath.item].title
        
        cell.facesImageView.image = UIImage(named: faceThemes[indexPath.item].themeImage)

        cell.outlineView.layer.shadowColor = UIColor.black.cgColor
        cell.outlineView.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.outlineView.layer.shadowOpacity = 0.5
        cell.outlineView.layer.shadowRadius = 8
        cell.outlineView.layer.cornerRadius = 20
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 180)
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
