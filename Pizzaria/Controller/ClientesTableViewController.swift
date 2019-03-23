//
//  ClientesTableViewController.swift
//  Pizzaria
//
//  Created by André Marafigo on 22/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

class ClientesTableViewController: UITableViewController {

    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var clientes : ClienteViewModel!
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItems?.append(editButtonItem)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clientes.listaClientes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listaClientes", for: indexPath)
        
        cell.textLabel?.text = clientes.listaClientes[indexPath.row].nome!
        cell.detailTextLabel?.text = clientes.listaClientes[indexPath.row].cpf!
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func addCliente(_ cliente : Cliente) {
        clientes.listaClientes.append(cliente)
        clientes.saveData()
        
        let cell = IndexPath(row: clientes.listaClientes.count - 1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [cell], with: .bottom)
        tableView.endUpdates()
    }
    
    func editCliente(_ cliente : Cliente) {
        let index = tableView.indexPathForSelectedRow?.row
        clientes.listaClientes[index!].nome = cliente.nome
        clientes.listaClientes[index!].cpf = cliente.cpf
        clientes.saveData()
        self.tableView.reloadData()
    }
    
    func editEndereco(_ enderecos : [Endereco]) {
        clientes.listaEnderecos = enderecos
//        let index = tableView.indexPathForSelectedRow?.row
//        clientes.listaEnderecos[index!].cliente = endereco.cliente
//        clientes.listaEnderecos[index!].cep = endereco.cep
//        clientes.listaEnderecos[index!].nome_rua = endereco.nome_rua
//        clientes.listaEnderecos[index!].numero = endereco.numero
        clientes.saveData()
        self.tableView.reloadData()
    }
    
    func editTelefone(_ telefones : [Telefone]) {
        clientes.listaTelefones = telefones
//        let index = tableView.indexPathForSelectedRow?.row
//        clientes.listaTelefones[index!].cliente = telefone.cliente
//        clientes.listaTelefones[index!].ddi = telefone.ddi
//        clientes.listaTelefones[index!].ddd = telefone.ddd
//        clientes.listaTelefones[index!].numero = telefone.numero
        clientes.saveData()
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next = segue.destination as! EditarClienteViewController
        next.owner = self
        
        if segue.identifier == "editarCliente" {
            next.editarCliente = clientes.listaClientes[(tableView.indexPathForSelectedRow?.row)!]
            //next.editarEnderecos = clientes.listaEnderecos
            //next.editarTelefones = clientes.listaTelefones
//            for e in clientes.listaEnderecos {
//                if e.cliente == next.editarCliente {
//                    next.editarEndereco = e
//                }
//            }
//            for t in clientes.listaTelefones {
//                if t.cliente == next.editarCliente {
//                    next.editarTelefone = t
//                }
//            }
        } else {
            next.editarCliente = nil
        }
    }

    
}
