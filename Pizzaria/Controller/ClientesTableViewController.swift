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
    
    override func viewWillAppear(_ animated: Bool) {
        clientes.loadData()
        tableView.reloadData()
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
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            clientes.deleteClienteData(clientes.listaClientes[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next = segue.destination as! EditarClienteViewController
        next.owner = self
        let index = tableView.indexPathForSelectedRow?.row
        
        if segue.identifier == "editarCliente" {
            next.editarCliente = clientes.listaClientes[(tableView.indexPathForSelectedRow?.row)!]
            next.index = index
        } else {
            next.editarCliente = nil
        }
    }

    
}
