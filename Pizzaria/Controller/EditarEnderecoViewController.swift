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
    
    let clienteViewModel : ClienteViewModel = ClienteViewModel()
    
    var owner : EnderecosTableViewController?
    
    var editarEndereco : Endereco?
    
    @IBOutlet weak var txtCEP: UITextField!
    @IBOutlet weak var txtRua: UITextField!
    @IBOutlet weak var txtNumero: UITextField!
    @IBOutlet weak var lblMsg: UILabel!
    @IBOutlet weak var btnMapa: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        if editarEndereco != nil {
            txtCEP.text = editarEndereco?.cep
            txtRua.text = editarEndereco?.nome_rua
            txtNumero.text = String(editarEndereco!.numero)
            btnMapa.isEnabled = true
        }else{
            btnMapa.isEnabled = false
        }
    }
    
    @IBAction func btnSalvarClick(_ sender: Any) {
        if (editarEndereco != nil) {
            var n = 0
            if editarEndereco!.cliente != nil && txtCEP.text != "" && txtRua.text != "" && txtNumero.text != ""{
                editarEndereco!.cep = txtCEP.text
                editarEndereco!.nome_rua = txtRua.text
                editarEndereco!.numero = Int16(txtNumero.text!)!
                
                for e in (clienteViewModel.listaEnderecos) {
                    if e == editarEndereco {
                        clienteViewModel.listaEnderecos[n] = editarEndereco!
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
            if txtCEP.text != "" && txtRua.text != "" && txtNumero.text != ""{
                editarEndereco = Endereco(context: contexto)
                editarEndereco!.cliente = owner?.owner?.editarCliente
                editarEndereco!.cep = txtCEP.text
                editarEndereco!.nome_rua = txtRua.text
                editarEndereco!.numero = Int16(txtNumero.text!)!
                
                clienteViewModel.listaEnderecos.append(editarEndereco!)
                clienteViewModel.saveData()
                
                lblMsg.text = "Dados salvos com sucesso!"
                
                self.viewWillAppear(true)
            }else{
                lblMsg.text = "Todos os campos são obrigatórios!"
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editarEnderecoToMapa" {
            let nextEditar = segue.destination as! MapaViewController
            
            let local : String = "\(String(describing: txtRua.text!)), N. \(String(describing: txtNumero.text!)) - CEP: \(String(describing: txtCEP.text!))"
            let nomeCliente : String = (editarEndereco?.cliente?.nome)!
            
            nextEditar.endereco = local
            nextEditar.nomeCliente = nomeCliente
        }
    }
}
