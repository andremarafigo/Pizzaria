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
    private var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Pizzaria.plist")
    
    private var listaPedidos: [Pedido] = []
    private let requestPedido: NSFetchRequest<Pedido> = Pedido.fetchRequest()
    
    init() {
        loadData()
    }
    
    var pedidos : [Pedido] {
        return listaPedidos
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

