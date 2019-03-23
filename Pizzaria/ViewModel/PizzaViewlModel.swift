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
    
    //var file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Pizzaria.plist")

    var listaPizzas: [Pizza] = []
    let requestPizza: NSFetchRequest<Pizza> = Pizza.fetchRequest()
    
    init() {
        loadData()
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
