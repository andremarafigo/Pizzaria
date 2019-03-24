//
//  EditarEnderecoViewController.swift
//  Pizzaria
//
//  Created by André Marafigo on 23/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

class EditarEnderecoViewController: UIViewController {

    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var owner : EnderecosTableViewController?
    
    var editarEndereco : Endereco?
    
    @IBOutlet weak var txtCEP: UITextField!
    @IBOutlet weak var txtRua: UITextField!
    @IBOutlet weak var txtNumero: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        if editarEndereco != nil {
            txtCEP.text = editarEndereco?.cep
            txtRua.text = editarEndereco?.nome_rua
            txtNumero.text = String(editarEndereco!.numero)
        }
    }
    
    @IBAction func btnCancelarClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSalvarClick(_ sender: Any) {
        if (editarEndereco != nil) {
            var n = 0
            let endereco = editarEndereco
            editarEndereco!.cep = txtCEP.text
            editarEndereco!.nome_rua = txtRua.text
            editarEndereco!.numero = Int16(txtNumero.text!)!
            
            for e in (owner?.owner?.owner?.clientes.listaEnderecos)! {
                if e == endereco {
                    owner?.owner?.owner?.clientes.listaEnderecos[n] = editarEndereco!
                }
                n += 1
            }
            owner?.editEndereco(editarEndereco!)
        }
        else {
            let e = Endereco(context: contexto)
            
            e.cliente = owner?.owner?.editarCliente
            e.cep = txtCEP.text
            e.nome_rua = txtRua.text
            e.numero = Int16(txtNumero.text!)!
            
            owner?.addEndereco(e)
        }
        
        navigationController?.popViewController(animated: true)
    }
}
