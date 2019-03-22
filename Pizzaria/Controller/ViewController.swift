//
//  ViewController.swift
//  Pizzaria
//
//  Created by ALUNO on 15/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var cliente : ClienteViewModel!
    var endereco : EnderecoViewModel!
    var telefone : TelefoneViewModel!
    var pizza : PizzaViewModel!
    var pedido : PedidoViewModel!
    var pizzasPedidos : PizzasPedidoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cliente = ClienteViewModel()
        endereco = EnderecoViewModel()
        telefone = TelefoneViewModel()
        pizza = PizzaViewModel()
        pedido = PedidoViewModel()
        pizzasPedidos = PizzasPedidoViewModel()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenuToSabores" {
            let parm = segue.destination as! CriaSaboresTableViewController
            parm.sabores = pizza
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

