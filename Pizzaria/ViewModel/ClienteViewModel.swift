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
    
    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var listaClientes: [Cliente] = []
    let requestCliente: NSFetchRequest<Cliente> = Cliente.fetchRequest()
    
    init() {
        loadData()
//        listaClientes[0].cpf = "111.111.111-11"
//        listaClientes[0].nome = "André Marafigo"
//        saveData()
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
            listaClientes = try contexto.fetch(requestCliente)
        }
        catch
        {
            print("Erro: \(error)")
        }
    }
}
