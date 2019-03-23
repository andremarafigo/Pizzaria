//
//  PizzasPedidoViewModel.swift
//  Pizzaria
//
//  Created by André Marafigo on 21/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PizzasPedidoViewModel {
    
    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Pizzaria.plist")
    
    var listaPizzasPedidos: [PizzasPedido] = []
    let requestPizzasPedido: NSFetchRequest<PizzasPedido> = PizzasPedido.fetchRequest()
    
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
            listaPizzasPedidos = try contexto.fetch(requestPizzasPedido)
        }
        catch
        {
            print("Erro: \(error)")
        }
    }
}
