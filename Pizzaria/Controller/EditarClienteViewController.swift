//
//  EditarClienteViewController.swift
//  Pizzaria
//
//  Created by André Marafigo on 23/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

class EditarClienteViewController: UIViewController {

    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var owner : ClientesTableViewController?
    var editarCliente : Cliente?
  
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtCPF: UITextField!
    
    @IBAction func btnCancelarClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSalvarClick(_ sender: AnyObject) {
        if (editarCliente != nil) {
            editarCliente!.nome = txtNome.text
            editarCliente!.cpf = txtCPF.text
            
            owner?.editCliente(editarCliente!)
        }
        else {
            let c = Cliente(context: contexto)
            c.nome = txtNome.text
            c.cpf = txtCPF.text
            
            owner?.addCliente(c)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
}
