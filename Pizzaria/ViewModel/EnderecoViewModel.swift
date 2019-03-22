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
    
    private var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Pizzaria.plist")

    private var listaEnderecos: [Endereco] = []
    private let requestEndereco: NSFetchRequest<Endereco> = Endereco.fetchRequest()

    init() {
        loadData()
    }
    
    var enderecos : [Endereco] {
        return listaEnderecos
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
        }
        catch
        {
            print("Erro: \(error)")
        }
    }
}
