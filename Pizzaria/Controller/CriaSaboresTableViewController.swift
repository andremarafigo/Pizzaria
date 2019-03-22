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
        sabores.saveData(pizza)
        
        let cell = IndexPath(row: sabores.listaPizzas.count - 1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [cell], with: .bottom)
        tableView.endUpdates()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaboresToSabor" {
            let parm = segue.destination as! EditarSaborViewController
            parm.owner = self
            //        } else if segue.identifier == "MenuToPedidos" {
            //            let parm = segue.destination as! PedidosTableViewController
            //            parm.telaInicial = self
            //        }else if segue.identifier == "PedidoToSabores" {
            //            let parm = segue.destination as! SaboresTableViewController
            //            parm.telaInicial = self
            //parm.operatioTypeIsAdd = true
        }
    }

}
