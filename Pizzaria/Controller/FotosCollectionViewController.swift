//
//  FotosCollectionViewController.swift
//  Pizzaria
//
//  Created by André Marafigo on 24/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FotosCollectionViewController: UICollectionViewController {
    
    var fotos: [String] = ["1",
                         "2",
                         "3",
                         "4",
                         "4",
                         "5",
                         "6",
                         "7",
                         "8",
                         "9",
                         "10",
                         "11",
                         "12"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fotos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fotoCell", for: indexPath) as! FotoCollectionViewCell
        
        cell.imageView.image = UIImage(named: fotos[indexPath.row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next = segue.destination as! FotoViewController
        //next.owner = self
        
        if segue.identifier == "verFoto" {
            //next.owner = self
            next.foto = fotos[(collectionView.indexPathsForSelectedItems!.last!.row)]
        }
    }
}
