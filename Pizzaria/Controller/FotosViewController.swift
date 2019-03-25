//
//  FotosViewController.swift
//  Pizzaria
//
//  Created by André Marafigo on 24/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//
/*
import UIKit

struct Item{
    var imageName: String
}

class FotosViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
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
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellIdentifier = "itemCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    private func setupCollectionView() {
        //collectionView.delegate = self
        //collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: IndexPath) as! FotoCollectionViewCell
        
        cell.ima
    }
}*/
