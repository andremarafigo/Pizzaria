//
//  EditarClienteViewController.swift
//  Pizzaria
//
//  Created by André Marafigo on 23/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit
import CoreData

class EditarClienteViewController: UIViewController {

    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let clienteViewModel : ClienteViewModel = ClienteViewModel()
    
    var owner : ClientesTableViewController?
    
    var editarCliente : Cliente?
    var index : Int?
    
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtCPF: UITextField!
    
    @IBOutlet weak var lblEndereco: UILabel!
    @IBOutlet weak var lblTelefone: UILabel!

    @IBOutlet weak var lblMsg: UILabel!
    
    @IBOutlet weak var btnEndereco: UIButton!
    @IBOutlet weak var btnTelefone: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        if editarCliente != nil {
            txtNome.text = editarCliente?.nome
            txtCPF.text = editarCliente?.cpf
            btnEndereco.isEnabled = true
            btnTelefone.isEnabled = true
            lblEndereco.text = String(editarCliente!.enderecos!.count)
            lblTelefone.text = String(editarCliente!.telefones!.count)
        }else{
            if txtNome.text == "" {
                lblMsg.text = "Salve Para Habilitar!"
            }
        }
    }
    
    @IBAction func btnSalvarClick(_ sender: AnyObject) {
        if (editarCliente != nil) {
            if txtNome.text != "" && txtCPF.text != ""{
                //var n = 0
                editarCliente!.nome = txtNome.text
                editarCliente!.cpf = txtCPF.text
                
//                for endereco in (clienteViewModel.listaEnderecos) {
//                    if endereco.cliente == editarCliente {
//                        clienteViewModel.listaEnderecos[n].cliente = editarCliente
//                    }
//                    n += 1
//                }
//
//                n = 0
//                for telefone in (clienteViewModel.listaTelefones) {
//                    if telefone.cliente == editarCliente {
//                        clienteViewModel.listaTelefones[n].cliente = editarCliente
//                    }
//                    n += 1
//                }
            
                clienteViewModel.saveData()
                
                lblMsg.text = "Dados salvos com sucesso!"
                self.viewWillAppear(true)
            }else{
                lblMsg.text = "Nome e CPF são Obrigatórios!"
            }
        }
        else {
            if txtNome.text != "" && txtCPF.text != ""{
                editarCliente = Cliente(context: contexto)
                editarCliente!.nome = txtNome.text
                editarCliente!.cpf = txtCPF.text
            
                clienteViewModel.listaClientes.append(editarCliente!)
                
                btnEndereco.isEnabled = true
                btnTelefone.isEnabled = true
                
                lblMsg.text = "Dados salvos com sucesso!"
                
                self.viewWillAppear(true)
            }else{
                lblMsg.text = "Nome e CPF são Obrigatórios!"
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editarClienteToEnderecos" {
            let next = segue.destination as! EnderecosTableViewController
            next.owner = self
            
            for endereco in (clienteViewModel.listaEnderecos) {
                if endereco.cliente == editarCliente && endereco.cliente != nil{
                    next.enderecos.append(endereco)
                }
            }
        }else if segue.identifier == "editarClienteToTelefones" {
            let next = segue.destination as! TelefonesTableViewController
            next.owner = self
            
            for telefone in (clienteViewModel.listaTelefones) {
                if telefone.cliente == editarCliente && telefone.cliente != nil{
                    next.telefones.append(telefone)
                }
            }
        }
    }
}
