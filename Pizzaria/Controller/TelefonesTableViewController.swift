//
//  TelefonesTableViewController.swift
//  Pizzaria
//
//  Created by André Marafigo on 23/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

class TelefonesTableViewController: UITableViewController {
    
    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let clienteViewModel : ClienteViewModel = ClienteViewModel()
    
    var owner : EditarClienteViewController?
    
    var telefones = [Telefone]()

    override func viewDidLoad() {
        navigationItem.rightBarButtonItems?.append(editButtonItem)
    }

    override func viewWillAppear(_ animated: Bool) {
        telefones = []
        clienteViewModel.loadData()
        for x in (owner?.owner?.clientes.listaTelefones)! {
            if x.cliente == owner?.editarCliente && x.cliente != nil{
                telefones.append(x)
            }
        }
        
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return telefones.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listaTelefones", for: indexPath)
        let nu = String(telefones[indexPath.row].numero!)
        
        cell.textLabel?.text = ("(+\(telefones[indexPath.row].ddi))-(\(telefones[indexPath.row].ddd))-\(nu)")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var n = 0
            for x in clienteViewModel.listaTelefones {
                if x == telefones[indexPath.row] {
                    clienteViewModel.deleteTelefoneData(clienteViewModel.listaTelefones[n])
                    telefones.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    self.tableView.reloadData()
                    break
                }
                n += 1
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next = segue.destination as! EditarTelefoneViewController
        next.owner = self
        
        if segue.identifier == "editarTelefone" {
            next.owner = self
            next.editarTelefone = telefones[(tableView.indexPathForSelectedRow?.row)!]
        } else {
            next.owner = self
            next.editarTelefone = nil
        }
    }
}
