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
    
    var owner : ClientesTableViewController?
    
    var editarCliente : Cliente?
    var index : Int?
    
    let clienteViewModel : ClienteViewModel = ClienteViewModel()
  
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
            //lblMsg.text = ""
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
    
    
//    @IBAction func btnCancelarClick(_ sender: Any) {
//        navigationController?.popViewController(animated: true)
//    }
    
    
    @IBAction func btnSalvarClick(_ sender: AnyObject) {
        if (editarCliente != nil) {
            var n = 0
            var x = 0
            if txtNome.text != "" && txtCPF.text != ""{
                while x == 0 {
                        let cliente = editarCliente
                        editarCliente!.nome = txtNome.text
                        editarCliente!.cpf = txtCPF.text
                        for endereco in (owner?.clientes.listaEnderecos)! {
                            if endereco.cliente == cliente {
                                owner?.clientes.listaEnderecos[n].cliente = editarCliente
                            }
                            n += 1
                        }
                    
                        n = 0
                        for telefone in (owner?.clientes.listaTelefones)! {
                            if telefone.cliente == cliente {
                                owner?.clientes.listaTelefones[n].cliente = editarCliente
                            }
                            n += 1
                        }
                    
                        clienteViewModel.saveData()
                    
                        lblMsg.text = "Dados salvos com sucesso!"
                        self.viewWillAppear(true)
                    
    //                    owner?.editCliente(editarCliente!)
    //                    navigationController?.popViewController(animated: true)
                        x = 1
                    }
            }else{
                lblMsg.text = "Nome e CPF são Obrigatórios!"
            }
        }
        else {
            var x = 0
            
            if txtNome.text != "" && txtCPF.text != ""{
                while x == 0 {
                    let c = Cliente(context: contexto)
                    c.nome = txtNome.text
                    c.cpf = txtCPF.text
                
                    owner?.addCliente(c)
                    btnEndereco.isEnabled = true
                    btnTelefone.isEnabled = true
                    
                    //clienteViewModel.saveData()
                    lblMsg.text = "Dados salvos com sucesso!"
                    self.viewWillAppear(true)
                    //navigationController?.popViewController(animated: true)
                    x = 1
                }
            }else{
                lblMsg.text = "Nome e CPF são Obrigatórios!"
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editarClienteToEnderecos" {
            let next = segue.destination as! EnderecosTableViewController
            next.owner = self
            
            for x in (owner?.clientes.listaEnderecos)! {
                if x.cliente == editarCliente && x.cliente != nil{
                    next.enderecos.append(x)
                }
            }
        }else if segue.identifier == "editarClienteToTelefones" {
            let next = segue.destination as! TelefonesTableViewController
            next.owner = self
            
            var n2 = 0
            
            for telefone in (owner?.clientes.listaTelefones)! {
                if telefone.cliente == editarCliente {
                    next.telefones.append((owner?.clientes.listaTelefones[n2])!)
                }
                n2 = n2 + 1
            }
        }
    }
}
