//
//  PedidosTableViewController.swift
//  Pizzaria
//
//  Created by André Marafigo on 17/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

class PedidosTableViewController: UITableViewController {

    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var pedidos : PedidoViewModel!
    
    var selectedIndex: Int = -1
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItems?.append(editButtonItem)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pedidos!.listaPedidos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listaPedidos", for: indexPath)
        
        cell.textLabel?.text = pedidos!.listaPedidos[indexPath.row].cliente?.nome

        return cell
    }
}
