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
    //var editarEnderecos : [Endereco]?
    //var editarTelefones : [Telefone]?
  
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtCPF: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        if editarCliente != nil {
            txtNome.text = editarCliente?.nome
            txtCPF.text = editarCliente?.cpf
        }
    }
    
    @IBAction func btnCancelarClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSalvarClick(_ sender: AnyObject) {
        if (editarCliente != nil) {
            var n = 0
            let cliente = editarCliente
            editarCliente!.nome = txtNome.text
            editarCliente!.cpf = txtCPF.text
            
            for endereco in (owner?.clientes.listaEnderecos)! {
                if endereco.cliente == cliente {
                    owner?.clientes.listaEnderecos[n].cliente = editarCliente
                    //e.cliente = editarCliente
                }
                n += 1
            }
            
            n = 0
            for telefone in (owner?.clientes.listaTelefones)! {
                if telefone.cliente == cliente {
                    owner?.clientes.listaTelefones[n].cliente = editarCliente
                    //e.cliente = editarCliente
                }
                n += 1
            }
            
            owner?.editCliente(editarCliente!)
//            owner?.editEndereco(editarEnderecos!)
//            owner?.editTelefone(editarTelefones!)
        }
        else {
            let c = Cliente(context: contexto)
            //let e = Endereco(context: contexto)
            //let t = Telefone(context: contexto)
            
            c.nome = txtNome.text
            c.cpf = txtCPF.text
            
            
            
            owner?.addCliente(c)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editarClienteToEnderecos" {
            let next = segue.destination as! EnderecosTableViewController
            next.owner = self
            
            var n = 0
            
            for endereco in (owner?.clientes.listaEnderecos)! {
                if endereco.cliente == editarCliente {
                    next.enderecos.append((owner?.clientes.listaEnderecos[n])!)
                }
                n += 1
            }
//        }else if segue.identifier == "editarTelefone" {
//            let next = segue.destination as! TelefonesTableViewController
//            next.owner = self
//
//            var n = 0
//
//            for endereco in (owner?.clientes.listaTelefones)! {
//                if endereco.cliente == editarCliente {
//                    next.telefones?.append((owner?.clientes.listaTelefones[n])!)
//                }
//                n += 1
//            }
        }
    }
    
}
