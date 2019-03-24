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
    @IBOutlet weak var lblMsg: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        if editarEndereco != nil {
            txtCEP.text = editarEndereco?.cep
            txtRua.text = editarEndereco?.nome_rua
            txtNumero.text = String(editarEndereco!.numero)
            lblMsg.text = ""
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
            editarEndereco!.numero = Int16(txtNumero.text!)!
            
            
            for e in (owner?.owner?.owner?.clientes.listaEnderecos)! {
                if e == endereco {
                    owner?.owner?.owner?.clientes.listaEnderecos[n] = editarEndereco!
                }
                n += 1
            }
            
            var x = 0
            while x == 0 {
                if endereco!.cliente != nil && txtCEP.text != "" && txtRua.text != "" && txtNumero.text != ""{
                    owner?.editEndereco(editarEndereco!)
                    navigationController?.popViewController(animated: true)
                    x = 1
                }else{
                    lblMsg.text = "Todos os Campos São Obrigatórios!"
                    break
                }
            }
        }
        else {
            let e = Endereco(context: contexto)
            
            e.cliente = owner?.owner?.editarCliente
            e.cep = txtCEP.text
            e.nome_rua = txtRua.text
            e.numero = Int16(txtNumero.text!)!

            var x = 0
            while x == 0 {
                if e.cliente != nil && txtCEP.text != "" && txtRua.text != "" && txtNumero.text != ""{
                    owner?.addEndereco(e)
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
