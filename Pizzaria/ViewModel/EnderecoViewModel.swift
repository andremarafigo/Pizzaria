//
//  EnderecoViewModel.swift
//  Pizzaria
//
//  Created by André Marafigo on 21/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EnderecoViewModel {
    
    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var listaEnderecos: [Endereco] = []
    let requestEndereco: NSFetchRequest<Endereco> = Endereco.fetchRequest()

    var listaClientes: [Cliente] = []
    let requestCliente: NSFetchRequest<Cliente> = Cliente.fetchRequest()
    
    init() {
        loadData()
        if listaClientes.count == 0 {
            let e = Endereco(context: contexto)
            e.cliente = listaClientes[0]
            e.cep = "111111-111"
            e.nome_rua = "Rua 01"
            e.numero = 1
            listaEnderecos.append(e)
            saveData()
        }
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
            listaEnderecos = try contexto.fetch(requestEndereco)
            listaClientes = try contexto.fetch(requestCliente)
        }
        catch
        {
            print("Erro: \(error)")
        }
    }
}
