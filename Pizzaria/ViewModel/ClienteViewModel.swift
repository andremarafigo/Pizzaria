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
    
    var listaEnderecos: [Endereco] = []
    let requestEndereco: NSFetchRequest<Endereco> = Endereco.fetchRequest()
    
    var listaTelefones: [Telefone] = []
    let requestTelefone: NSFetchRequest<Telefone> = Telefone.fetchRequest()
    
    init() {
        loadData()
        if listaClientes.count == 0 {
            let c = Cliente(context: contexto)
            c.nome = "André Marafigo"
            c.cpf = "111.111.111-11"
            listaClientes.append(c)
            saveData()
            
            let e = Endereco(context: contexto)
            e.cliente = listaClientes[0]
            e.cep = "80215-901"
            e.nome_rua = "R. Imac. Conceicao, Paraná"
            e.numero = 1155
            listaEnderecos.append(e)
            saveData()
            
            let t = Telefone(context: contexto)
            t.cliente = listaClientes[0]
            t.ddi = 55
            t.ddd = 41
            t.numero = "99999-0001"
            saveData()
        }
    }
    
    func deleteClienteData(_ cliente : Cliente) {
        contexto.delete(cliente)
        loadData()
    }
    
    func deleteEnderecoData(_ endereco : Endereco) {
        contexto.delete(endereco)
        loadData()
    }
    
    func deleteTelefoneData(_ telefone : Telefone) {
        contexto.delete(telefone)
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
            listaClientes = try contexto.fetch(requestCliente)
            listaEnderecos = try contexto.fetch(requestEndereco)
            listaTelefones = try contexto.fetch(requestTelefone)
        }
        catch
        {
            print("Erro: \(error)")
        }
    }
}
