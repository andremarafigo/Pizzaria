//
//  SiteViewController.swift
//  Pizzaria
//
//  Created by ALUNO on 22/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit
import WebKit

class SiteViewController: UIViewController {

    @IBOutlet weak var mSobre: WKWebView!
    let urlSobre = URL(string: "https://www.justinopizzabar.com.br")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let request = URLRequest(url: urlSobre!)
        mSobre.load(request)
        
    }
}
