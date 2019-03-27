//
//  EditarTelefoneViewController.swift
//  Pizzaria
//
//  Created by André Marafigo on 23/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

class EditarTelefoneViewController: UIViewController {

    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var owner : TelefonesTableViewController?
    
    var editarTelefone : Telefone?

    @IBOutlet weak var txtDDI: UITextField!
    @IBOutlet weak var txtDDD: UITextField!
    @IBOutlet weak var txtNumero: UITextField!
    @IBOutlet weak var lblMsg: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        if editarTelefone != nil {
            txtDDI.text = String(editarTelefone!.ddi)
            txtDDD.text = String(editarTelefone!.ddd)
            txtNumero.text = editarTelefone!.numero
            lblMsg.text = ""
        }
    }
    @IBAction func btnCancelarClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func btnSalvarClick(_ sender: Any) {
        if (editarTelefone != nil) {
            var n = 0
            let telefone = editarTelefone
            editarTelefone!.ddi = Int16(txtDDI.text!)!
            editarTelefone!.ddd = Int16(txtDDD.text!)!
            editarTelefone!.numero = txtNumero.text
            
            for e in (owner?.owner?.owner?.clientes.listaTelefones)! {
                if e == telefone {
                    owner?.owner?.owner?.clientes.listaTelefones[n] = editarTelefone!
                }
                n += 1
            }
            
            var x = 0
            while x == 0 {
                if telefone!.cliente != nil && txtDDI.text != "" && txtDDD.text != "" && txtNumero.text != ""{
                    owner?.editTelefone(editarTelefone!)
                    navigationController?.popViewController(animated: true)
                    x = 1
                }else{
                    lblMsg.text = "Todos os Campos São Obrigatórios!"
                    break
                }
            }
        }
        else {
            let t = Telefone(context: contexto)
            
            t.cliente = owner?.owner?.editarCliente
            t.ddi = Int16(txtDDI.text!)!
            t.ddd = Int16(txtDDD.text!)!
            t.numero = txtNumero.text
            
            var x = 0
            while x == 0 {
                if t.cliente != nil && txtDDI.text != "" && txtDDD.text != "" && txtNumero.text != ""{
                    owner?.addTelefone(t)
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
