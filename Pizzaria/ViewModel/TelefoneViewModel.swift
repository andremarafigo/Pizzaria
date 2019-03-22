//
//  TelefoneViewModel.swift
//  Pizzaria
//
//  Created by André Marafigo on 21/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TelefoneViewModel {
    
    private var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Pizzaria.plist")
    
    private var listaTelefones: [Telefone] = []
    private let requestTelefone: NSFetchRequest<Telefone> = Telefone.fetchRequest()
    
    init() {
        loadData()
    }
    
    var telefones : [Telefone] {
        return listaTelefones
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
            listaTelefones = try contexto.fetch(requestTelefone)
        }
        catch
        {
            print("Erro: \(error)")
        }
    }
}
