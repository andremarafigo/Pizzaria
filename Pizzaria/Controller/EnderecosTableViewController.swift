//
//  EnderecosTableViewController.swift
//  Pizzaria
//
//  Created by André Marafigo on 23/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

protocol EnderecoTableView {
    func onClickCell(index: Int)
}

class EnderecosTableViewController: UITableViewController {

    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var owner : EditarClienteViewController?
    
    var enderecos : [Endereco] = []
    
    var indexx : IndexPath?
    
    func onClickCell(index: Int) {
        print("\(index)")
    }
    
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
        
        let t: String = ("\(enderecos[indexPath.row].nome_rua!)")
        let n: String = String("\(enderecos[indexPath.row].numero)")
        let tn: String = "\(t), N.-\(n)"
        cell.textLabel?.text = tn
        
//        let cell2 = tableView.dequeueReusableCell(withIdentifier: "listaEnderecos", for: indexPath) as? EnderecosTableViewController
//        cell2?.indexx = indexPath
        
        return cell
    }
    
//    @IBAction func btnMapaClick(_ sender: Any) {
//
//        //let index = tableView.indexPathForSelectedRow?.row
//
//        let mapa = UIStoryboard(name: "mapaView", bundle: nil).instantiateInitialViewController()! as! MapaViewController
//        mapa.local = "Foi"
//        self.present(mapa, animated: true, completion: nil)
//
//
//        let mapa = storyboard?.instantiateViewController(withIdentifier: "mapaView") as! MapaViewController
//        mapa.local = "Sucesso"
//        navigationController?.pushViewController(mapa, animated: true)
//    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var n = 0
            for x in owner!.owner!.clientes.listaEnderecos {
                if x == enderecos[indexPath.row] {
                    owner!.owner!.clientes.deleteEnderecoData(owner!.owner!.clientes.listaEnderecos[n])
                    enderecos.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    self.tableView.reloadData()
                    break
                }
                n += 1
            }
        }
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
        if segue.identifier == "criarEndereco" {
            let nextEditar = segue.destination as! EditarEnderecoViewController
            nextEditar.owner = self
            nextEditar.editarEndereco = nil
        }else if segue.identifier == "editarEndereco" {
            let nextEditar = segue.destination as! EditarEnderecoViewController
            nextEditar.owner = self
            nextEditar.editarEndereco = enderecos[(tableView.indexPathForSelectedRow?.row)!]
        }
//        }else if segue.identifier == "mapa"{
//            let nextMapa = segue.destination as! MapaViewController
//            nextMapa.endereco = enderecos[(tableView.indexPathForSelectedRow?.row)!]
//        }
    }
}
