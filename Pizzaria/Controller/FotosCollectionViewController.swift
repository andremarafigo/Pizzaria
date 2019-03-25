//
//  FotosCollectionViewController.swift
//  Pizzaria
//
//  Created by André Marafigo on 24/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

struct Item {
    var imageName: String
}

class FotosCollectionViewController: UICollectionViewController {

    //var collectionViewFlowLayout: UICollectionViewFlowLayout!
    //let cellIdentifier = "itemCollectionViewCell"
    
    var itens: [Item] = [Item(imageName: "1"),
                         Item(imageName: "2"),
                         Item(imageName: "3"),
                         Item(imageName: "4"),
                         Item(imageName: "4"),
                         Item(imageName: "5"),
                         Item(imageName: "6"),
                         Item(imageName: "7"),
                         Item(imageName: "8"),
                         Item(imageName: "9"),
                         Item(imageName: "10"),
                         Item(imageName: "11"),
                         Item(imageName: "12")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
/*
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //setupCollectionViewItemSize()
    }*/
    /*
    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemPerRow: CGFloat = 3
            let lineSpacing: CGFloat = 5
            let interItemSpacing: CGFloat = 5
            
            let width = (collectionView.frame.width - (numberOfItemPerRow - 1) * interItemSpacing) / numberOfItemPerRow
            let height = width
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }*/
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itens.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fotoCell", for: indexPath)
    
        return cell
    }
    /*
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt: \(indexPath)")
    }*/
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
