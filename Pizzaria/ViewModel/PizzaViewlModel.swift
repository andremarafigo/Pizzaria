//
//  PizzaViewlModel.swift
//  Pizza
//
//  Created by André Marafigo on 21/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PizzaViewModel {
    
    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
 
    var listaPizzas: [Pizza] = []
    let requestPizza: NSFetchRequest<Pizza> = Pizza.fetchRequest()
    
    init() {
        loadData()
        if listaPizzas.count == 0 {
            let p = Pizza(context: contexto)
            p.sabor = "Quatro Queijo"
            p.tamanho = "M"
            p.valor = 20.00
            listaPizzas.append(p)
            saveData()
        }
    }

    func saveData() {
        do {
            try contexto.save()
        } catch  {
            print("Erro ao salvar o contexto: \(error) ")
        }
        loadData()
    }
    
    func loadData() {
        do
        {
            listaPizzas = try contexto.fetch(requestPizza)
        }
        catch
        {
            print("Erro: \(error)")
        }
    }
}
