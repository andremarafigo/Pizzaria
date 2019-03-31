//
//  FotoViewController.swift
//  Pizzaria
//
//  Created by André Marafigo on 31/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

class FotoViewController: UIViewController {

    var foto : String = ""
    
    @IBOutlet weak var imageFoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageFoto.image = UIImage(named: foto)
    }
}
