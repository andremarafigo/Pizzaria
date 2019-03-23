//
//  EditarSaborViewController.swift
//  Pizzaria
//
//  Created by André Marafigo on 21/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

class EditarPizzaViewController: UIViewController {

    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var owner : PizzasTableViewController?
    var editarPizza : Pizza?
    
    @IBOutlet weak var txtSabor: UITextField!
    @IBOutlet weak var txtTamanho: UITextField!
    @IBOutlet weak var txtValor: UITextField!

    override func viewWillAppear(_ animated: Bool) {
        if editarPizza != nil {
            txtSabor.text = editarPizza?.sabor
            txtTamanho.text = editarPizza?.tamanho
            txtValor.text = String(editarPizza!.valor)
        }
    }

    @IBAction func onCancelarClick(sender: AnyObject){
        navigationController?.popViewController(animated: true)
    }


    @IBAction func btnSalvarClick(sender: AnyObject){
        
        if (editarPizza != nil) {
            editarPizza!.sabor = txtSabor.text
            editarPizza!.tamanho = txtTamanho.text
            editarPizza!.valor = Double(txtValor.text!)!
            
            owner?.editPizza(editarPizza!)
        }
        else {
            let p = Pizza(context: contexto)
            p.sabor = txtSabor.text
            p.tamanho = txtTamanho.text
            p.valor = Double(txtValor.text!)!
            
            owner?.addPizza(p)
        }
        
        navigationController?.popViewController(animated: true)
    }
}
