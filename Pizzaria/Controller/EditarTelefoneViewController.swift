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
    
    override func viewWillAppear(_ animated: Bool) {
        if editarTelefone != nil {
            txtDDI.text = String(editarTelefone!.ddi)
            txtDDD.text = String(editarTelefone!.ddd)
            txtNumero.text = editarTelefone!.numero
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
            owner?.editTelefone(editarTelefone!)
        }
        else {
            let t = Telefone(context: contexto)
            
            t.cliente = owner?.owner?.editarCliente
            t.ddi = Int16(txtDDI.text!)!
            t.ddd = Int16(txtDDD.text!)!
            t.numero = txtNumero.text
            
            owner?.addTelefone(t)
        }
        
        navigationController?.popViewController(animated: true)
    }
}
