//
//  PizzaViewModel.swift
//  Pizzaria
//
//  Created by André Marafigo on 17/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

/*import Foundation

class PedidoViewModel {
    
    private let pedido: Pedidos = Pedidos()
    
    private (set) var currentNumber = 0
    private (set) var score = 0
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Perguntas.plist")
    
    var pedidos : [Pedido] {
        return pedido.pedidos
    }
    
    var current : Pedido {
        return pedido.pedidos[currentNumber]
    }
    
    var isLast : Bool {
        return currentNumber == pedido.pedidos.count - 1
    }
    
    var isFirst : Bool {
        return currentNumber == 0
    }
    
    var count : Int {
        return pedido.pedidos.count
    }
    
    init() {
        //pedido.addObserver(self)
    }
    
    func reset() {
        currentNumber = 0
        score = 0
    }
    
//    func checkAnswer(_ choice: Int) -> Bool {
//
//        if choice == pedido.correct {
//            score += 1
//            return true
//        }
//
//        return false
//    }
    
    func next() {
        if currentNumber < pedido.pedidos.count - 1 {
            currentNumber+=1
        }
    }
    
    func previous() {
        if currentNumber > 0 {
            currentNumber-=1
        }
    }
    
    func add(_ pedidoo: Pedido) {
        pedido.pedidos.append(pedidoo)
    }
    
    func remove(_ number : Int) {
        pedido.pedidos.remove(at: number)
    }
    
    func update() {
        
    }
}*/

