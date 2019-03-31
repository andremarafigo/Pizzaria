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
    
    let pizzaViewModel : PizzaViewModel = PizzaViewModel()
    
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
        }
    }

    @IBAction func btnSalvarClick(sender: AnyObject){
        
        if (editarPizza != nil) {
            if txtSabor.text != "" && txtTamanho.text != "" && txtValor.text != ""{
                editarPizza!.sabor = txtSabor.text
                editarPizza!.tamanho = txtTamanho.text
                editarPizza!.valor = Double(txtValor.text!)!
                
                pizzaViewModel.saveData()
                lblMsg.text = "Dados salvos com sucesso!"
                
                self.viewWillAppear(true)
            }else{
                lblMsg.text = "Todos os campos são obrigatórios!"
            }
        }else {
            if txtSabor.text != "" && txtTamanho.text != "" && txtValor.text != ""{
                editarPizza = Pizza(context: contexto)
                editarPizza?.sabor = txtSabor.text
                editarPizza?.tamanho = txtTamanho.text
                editarPizza?.valor = Double(txtValor.text!)!
                
                pizzaViewModel.listaPizzas.append(editarPizza!)
                pizzaViewModel.saveData()
                
                lblMsg.text = "Dados salvos com sucesso!"
                
                self.viewWillAppear(true)
            }else{
                lblMsg.text = "Todos os campos são obrigatórios!"
            }
        }
    }
}
