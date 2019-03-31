//
//  CriaSaboresTableViewController.swift
//  Pizzaria
//
//  Created by ALUNO on 20/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

class PizzasTableViewController: UITableViewController {

    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var pizzas : PizzaViewModel!

    override func viewDidLoad() {
        navigationItem.rightBarButtonItems?.append(editButtonItem)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pizzas.loadData()
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzas.listaPizzas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todosSabores", for: indexPath)
        
        cell.textLabel?.text = pizzas.listaPizzas[indexPath.row].sabor!
        cell.detailTextLabel?.text = pizzas.listaPizzas[indexPath.row].tamanho!
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            pizzas.deletData(pizzas.listaPizzas[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next = segue.destination as! EditarPizzaViewController
        next.owner = self
        
        if segue.identifier == "editarSabor" {
            next.editarPizza = pizzas.listaPizzas[(tableView.indexPathForSelectedRow?.row)!]
        } else {
            next.editarPizza = nil
        }
    }

}
