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
    
    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var listaTelefones: [Telefone] = []
    let requestTelefone: NSFetchRequest<Telefone> = Telefone.fetchRequest()
    
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
            listaTelefones = try contexto.fetch(requestTelefone)
        }
        catch
        {
            print("Erro: \(error)")
        }
    }
}
