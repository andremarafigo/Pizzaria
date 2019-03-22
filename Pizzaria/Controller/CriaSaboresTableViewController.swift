//
//  CriaSaboresTableViewController.swift
//  Pizzaria
//
//  Created by ALUNO on 20/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

class CriaSaboresTableViewController: UITableViewController {

    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var sabores : PizzaViewModel!
    
    var selectedIndex: Int = -1

    override func viewDidLoad() {
        navigationItem.rightBarButtonItems?.append(editButtonItem)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sabores.listaPizzas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todosSabores", for: indexPath)

//        let sabor = "\(sabores.listaPizzas[indexPath.row].sabor!) - \(sabores.listaPizzas[indexPath.row].tamanho!)"
        
        cell.textLabel?.text = sabores.listaPizzas[indexPath.row].sabor!
        cell.detailTextLabel?.text = sabores.listaPizzas[indexPath.row].tamanho!
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func addPizza(_ pizza : Pizza) {
        sabores.listaPizzas.append(pizza)
        sabores.saveData()
        
        let cell = IndexPath(row: sabores.listaPizzas.count - 1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [cell], with: .bottom)
        tableView.endUpdates()
    }
    
    func editPizza(_ pizza : Pizza) {
        let index = tableView.indexPathForSelectedRow?.row
        sabores.listaPizzas[index!].sabor = pizza.sabor
        sabores.listaPizzas[index!].tamanho = pizza.tamanho
        sabores.listaPizzas[index!].valor = pizza.valor
        sabores.saveData()
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next = segue.destination as! EditarSaborViewController
        next.owner = self
        
        if segue.identifier == "editarSabor" {
            next.editarSabor = sabores.listaPizzas[(tableView.indexPathForSelectedRow?.row)!]
        } else {
            next.editarSabor = nil
        }
    }

}
