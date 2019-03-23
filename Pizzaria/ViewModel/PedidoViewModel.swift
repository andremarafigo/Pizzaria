//
//  PizzaViewModel.swift
//  Pizzaria
//
//  Created by André Marafigo on 17/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PedidoViewModel {
    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var listaPedidos: [Pedido] = []
    let requestPedido: NSFetchRequest<Pedido> = Pedido.fetchRequest()
    
    init() {
        loadData()
    }
    
    func saveData() {
        do {
            try contexto.save()
        } catch  {
            print("Erro ao salvar o contexto: \(error) ")
        }
    }
    
    func loadData() {
        do
        {
            listaPedidos = try contexto.fetch(requestPedido)
        }
        catch
        {
            print("Erro: \(error)")
        }
    }
}

