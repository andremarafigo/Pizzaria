//
//  EnderecosTableViewController.swift
//  Pizzaria
//
//  Created by André Marafigo on 23/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

class EnderecosTableViewController: UITableViewController {

    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var owner : EditarClienteViewController?
    
    var enderecos = [Endereco]()
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItems?.append(editButtonItem)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return enderecos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listaEnderecos", for: indexPath)
        
        cell.textLabel?.text = enderecos[indexPath.row].nome_rua
        cell.detailTextLabel?.text = String(enderecos[indexPath.row].numero)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func addEndereco(_ endereco : Endereco) {
        enderecos.append(endereco)
        owner?.owner?.clientes.listaEnderecos.append(endereco)
        owner?.owner?.clientes.saveData()
        
        let cell = IndexPath(row: enderecos.count - 1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [cell], with: .bottom)
        tableView.endUpdates()
    }
    
    func editEndereco(_ endereco : Endereco) {
        var n = 0
        for e in (owner?.owner?.clientes.listaEnderecos)! {
            if e == endereco {
                owner?.owner?.clientes.listaEnderecos[n] = endereco
            }
            n += 1
        }
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next = segue.destination as! EditarEnderecoViewController
        next.owner = self
        
        if segue.identifier == "editarEndereco" {
            next.editarEndereco = enderecos[(tableView.indexPathForSelectedRow?.row)!]
        } else {
            next.editarEndereco = nil
        }
    }
}
