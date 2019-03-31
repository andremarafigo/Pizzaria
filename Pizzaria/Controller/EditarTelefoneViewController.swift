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
    
    let clienteViewModel : ClienteViewModel = ClienteViewModel()

    @IBOutlet weak var txtDDI: UITextField!
    @IBOutlet weak var txtDDD: UITextField!
    @IBOutlet weak var txtNumero: UITextField!
    @IBOutlet weak var lblMsg: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        if editarTelefone != nil {
            txtDDI.text = String(editarTelefone!.ddi)
            txtDDD.text = String(editarTelefone!.ddd)
            txtNumero.text = editarTelefone!.numero
        }
    }
    
    @IBAction func btnSalvarClick(_ sender: Any) {
        if (editarTelefone != nil) {
            var n = 0
            if editarTelefone!.cliente != nil && txtDDI.text != "" && txtDDD.text != "" && txtNumero.text != ""{
                editarTelefone!.ddi = Int16(txtDDI.text!)!
                editarTelefone!.ddd = Int16(txtDDD.text!)!
                editarTelefone!.numero = txtNumero.text
                
                for e in (clienteViewModel.listaTelefones) {
                    if e == editarTelefone {
                        clienteViewModel.listaTelefones[n] = editarTelefone!
                    }
                    n += 1
                }
                
                clienteViewModel.saveData()
                
                lblMsg.text = "Dados salvos com sucesso!"
                self.viewWillAppear(true)
            }else{
                lblMsg.text = "Todos os campos são obrigatórios!"
            }
        }
        else {
            if txtDDI.text != "" && txtDDD.text != "" && txtNumero.text != ""{
                editarTelefone = Telefone(context: contexto)
                editarTelefone!.cliente = owner?.owner?.editarCliente
                editarTelefone!.ddi = Int16(txtDDI.text!)!
                editarTelefone!.ddd = Int16(txtDDD.text!)!
                editarTelefone!.numero = txtNumero.text
            
                clienteViewModel.listaTelefones.append(editarTelefone!)
                clienteViewModel.saveData()
                
                lblMsg.text = "Dados salvos com sucesso!"
                
                self.viewWillAppear(true)
            }else{
                lblMsg.text = "Todos os Campos São Obrigatórios!"
            }
        }
    }
}
