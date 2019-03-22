//
//  EditarSaborViewController.swift
//  Pizzaria
//
//  Created by André Marafigo on 21/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

class EditarSaborViewController: UIViewController {

    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var txtSabor: UITextField!
    @IBOutlet weak var txtTamanho: UITextField!
    @IBOutlet weak var txtValor: UITextField!

    var owner : CriaSaboresTableViewController?
    var editarSabor : Pizza?

    override func viewWillAppear(_ animated: Bool) {
        if editarSabor != nil {
            txtSabor.text = editarSabor?.sabor
            txtTamanho.text = editarSabor?.tamanho
            txtValor.text = String(editarSabor!.valor)
        }
    }

    @IBAction func onCancelarClick(sender: AnyObject){
        navigationController?.popViewController(animated: true)
    }


    @IBAction func btnSalvarClick(sender: AnyObject){
        let p = Pizza(context: contexto)
        p.sabor = txtSabor.text
        p.tamanho = txtTamanho.text
        p.valor = Double(txtValor.text!)!

        owner?.addPizza(p)
        
        navigationController?.popViewController(animated: true)
    }
}
