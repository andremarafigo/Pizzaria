//
//  ClienteViewModel.swift
//  Pizzaria
//
//  Created by André Marafigo on 21/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ClienteViewModel {
    
    private var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Pizzaria.plist")
    
    private var listaClientes: [Cliente] = []
    private let requestCliente: NSFetchRequest<Cliente> = Cliente.fetchRequest()
    
    init() {
        loadData()
    }
    
    var clientes : [Cliente] {
        return listaClientes
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
            listaClientes = try contexto.fetch(requestCliente)
        }
        catch
        {
            print("Erro: \(error)")
        }
    }
}
