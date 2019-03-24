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
    @IBOutlet weak var lblMsg: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        if editarPizza != nil {
            txtSabor.text = editarPizza?.sabor
            txtTamanho.text = editarPizza?.tamanho
            txtValor.text = String(editarPizza!.valor)
            lblMsg.text = ""
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
            
            var x = 0
            while x == 0 {
                if txtSabor.text != "" && txtTamanho.text != "" && txtValor.text != ""{
                    owner?.editPizza(editarPizza!)
                    navigationController?.popViewController(animated: true)
                    x = 1
                }else{
                    lblMsg.text = "Todos os Campos São Obrigatórios!"
                    break
                }
            }
        }
        else {
            let p = Pizza(context: contexto)
            
            p.sabor = txtSabor.text
            p.tamanho = txtTamanho.text
            p.valor = Double(txtValor.text!)!
            
            var x = 0
            while x == 0 {
                if txtSabor.text != "" && txtTamanho.text != "" && txtValor.text != ""{
                    owner?.addPizza(p)
                    lblMsg.text = ""
                    navigationController?.popViewController(animated: true)
                    x = 1
                }else{
                    lblMsg.text = "Todos os Campos São Obrigatórios!"
                    break
                }
            }
        }
    }
}
