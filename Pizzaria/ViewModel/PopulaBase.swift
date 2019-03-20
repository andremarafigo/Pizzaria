//
//  PopulaBase.swift
//  Pizzaria
//
//  Created by ALUNO on 18/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class PopulaBase {
    var contexto = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
    var listaClientes: [Cliente]
    var listaEnderecos: [Endereco]
    var listaTelefones: [Telefone]
    var listaPizzas: [Pizza]
    var listaPedidos: [Pedido]
    var listaPizzasPedidos: [PizzasPedido]
    
    init() {
        listaClientes = [Cliente]()
        listaEnderecos = [Endereco]()
        listaTelefones = [Telefone]()
        listaPizzas = [Pizza]()
        listaPedidos = [Pedido]()
        listaPizzasPedidos = [PizzasPedido]()
        
        criaClientes()
        criaEnderecos()
        criaTelefones()
        criaPizzas()
        criaPedidos()
    }
    
    func criaClientes() {
        let cliente1: Cliente = Cliente(context: contexto)
        let cliente2: Cliente = Cliente(context: contexto)
        let cliente3: Cliente = Cliente(context: contexto)
        let cliente4: Cliente = Cliente(context: contexto)
        let cliente5: Cliente = Cliente(context: contexto)
        
        cliente1.cpf = "111.111.111-11"
        cliente1.nome = "André Marafigo"
        listaClientes.append(cliente1)
        
        
        cliente2.cpf = "222.222.222-22"
        cliente2.nome = "João"
        listaClientes.append(cliente2)
        
        cliente3.cpf = "333.333.333-33"
        cliente3.nome = "Frederico"
        listaClientes.append(cliente3)
        
        cliente4.cpf = "444.444.444-44"
        cliente4.nome = "Pedro"
        listaClientes.append(cliente4)
        
        cliente5.cpf = "555.555.555-55"
        cliente5.nome = "Paulo"
        listaClientes.append(cliente5)
    }
    
    func criaEnderecos() {
        let endereço1: Endereco = Endereco(context: contexto)
        let endereço2: Endereco = Endereco(context: contexto)
        let endereço3: Endereco = Endereco(context: contexto)
        let endereço4: Endereco = Endereco(context: contexto)
        let endereço5: Endereco = Endereco(context: contexto)

        endereço1.cliente = listaClientes[0]
        endereço1.cep = "111111-111"
        endereço1.nome_rua = "Rua 01"
        endereço1.numero = 1
        listaEnderecos.append(endereço1)
        
        endereço2.cliente = listaClientes[1]
        endereço2.cep = "222222-222"
        endereço2.nome_rua = "Rua 02"
        endereço2.numero = 2
        listaEnderecos.append(endereço2)
        
        endereço3.cliente = listaClientes[2]
        endereço3.cep = "333333-333"
        endereço3.nome_rua = "Rua 03"
        endereço3.numero = 3
        listaEnderecos.append(endereço3)
        
        endereço4.cliente = listaClientes[3]
        endereço4.cep = "444444-444"
        endereço4.nome_rua = "Rua 04"
        endereço4.numero = 4
        listaEnderecos.append(endereço4)
        
        endereço5.cliente = listaClientes[4]
        endereço5.cep = "555555-555"
        endereço5.nome_rua = "Rua 05"
        endereço5.numero = 5
        listaEnderecos.append(endereço5)
    }
    
    func criaTelefones() {
        let telefone1: Telefone = Telefone(context: contexto)
        let telefone2: Telefone = Telefone(context: contexto)
        let telefone3: Telefone = Telefone(context: contexto)
        let telefone4: Telefone = Telefone(context: contexto)
        let telefone5: Telefone = Telefone(context: contexto)
        
        telefone1.cliente = listaClientes[0]
        telefone1.ddi = 55
        telefone1.ddd = 41
        telefone1.numero = "99999-0001"
        listaTelefones.append(telefone1)
        
        telefone2.cliente = listaClientes[1]
        telefone2.ddi = 55
        telefone2.ddd = 41
        telefone2.numero = "99999-0002"
        listaTelefones.append(telefone2)
        
        telefone3.cliente = listaClientes[2]
        telefone3.ddi = 55
        telefone3.ddd = 41
        telefone3.numero = "99999-0003"
        listaTelefones.append(telefone3)
        
        telefone4.cliente = listaClientes[3]
        telefone4.ddi = 55
        telefone4.ddd = 41
        telefone4.numero = "99999-0004"
        listaTelefones.append(telefone4)
        
        telefone5.cliente = listaClientes[4]
        telefone5.ddi = 55
        telefone5.ddd = 41
        telefone5.numero = "99999-0005"
        listaTelefones.append(telefone5)
    }
    
    func criaPizzas() {
        let pizza1: Pizza = Pizza(context: contexto)
        let pizza2: Pizza = Pizza(context: contexto)
        let pizza3: Pizza = Pizza(context: contexto)
        let pizza4: Pizza = Pizza(context: contexto)
        let pizza5: Pizza = Pizza(context: contexto)
        let pizza6: Pizza = Pizza(context: contexto)
        let pizza7: Pizza = Pizza(context: contexto)
        let pizza8: Pizza = Pizza(context: contexto)
        let pizza9: Pizza = Pizza(context: contexto)
        
        pizza1.sabor = "Quatro Queijo"
        pizza1.tamanho = "M"
        pizza1.valor = 20.00
        listaPizzas.append(pizza1)
        
        pizza2.sabor = "Quatro Queijo"
        pizza2.tamanho = "G"
        pizza2.valor = 30.00
        listaPizzas.append(pizza2)
        
        pizza3.sabor = "Quatro Queijo"
        pizza3.tamanho = "GG"
        pizza3.valor = 40.00
        listaPizzas.append(pizza3)
        
        pizza4.sabor = "Calabresa"
        pizza4.tamanho = "M"
        pizza4.valor = 20.00
        listaPizzas.append(pizza4)
        
        pizza5.sabor = "Calabresa"
        pizza5.tamanho = "G"
        pizza5.valor = 30.00
        listaPizzas.append(pizza5)
        
        pizza6.sabor = "Calabresa"
        pizza6.tamanho = "GG"
        pizza6.valor = 40.00
        listaPizzas.append(pizza6)
        
        pizza7.sabor = "Frango com Catupiry"
        pizza7.tamanho = "M"
        pizza7.valor = 20.00
        listaPizzas.append(pizza7)
        
        pizza8.sabor = "Frango com Catupiry"
        pizza8.tamanho = "G"
        pizza8.valor = 30.00
        listaPizzas.append(pizza8)
        
        pizza9.sabor = "Frango com Catupiry"
        pizza9.tamanho = "GG"
        pizza9.valor = 40.00
        listaPizzas.append(pizza9)
    }
    
    func criaPedidos() {
        let pedido1: Pedido = Pedido(context: contexto)
        let pedido2: Pedido = Pedido(context: contexto)
        let pizzaPedido1: PizzasPedido = PizzasPedido(context: contexto)
        let pizzaPedido2: PizzasPedido = PizzasPedido(context: contexto)
        let pizzaPedido3: PizzasPedido = PizzasPedido(context: contexto)
        let pizzaPedido4: PizzasPedido = PizzasPedido(context: contexto)
        
        pedido1.dataHora = Date()
        pedido1.cliente = listaClientes[0]
        
        pizzaPedido1.pedido = pedido1
        pizzaPedido1.pizza = self.listaPizzas[0]
        pizzaPedido1.nPizza = 1
        pizzaPedido1.divisao = 3
        pizzaPedido1.quantidade = 1
        listaPizzasPedidos.append(pizzaPedido1)
        pedido1.valorTotal += (pizzaPedido1.pizza?.valor)!
        
        pizzaPedido2.pedido = pedido1
        pizzaPedido2.pizza = self.listaPizzas[1]
        pizzaPedido2.nPizza = 1
        pizzaPedido2.divisao = 3
        pizzaPedido2.quantidade = 1
        listaPizzasPedidos.append(pizzaPedido2)
        pedido1.valorTotal += (pizzaPedido2.pizza?.valor)!
        
        pizzaPedido3.pedido = pedido1
        pizzaPedido3.pizza = listaPizzas[2]
        pizzaPedido3.nPizza = 1
        pizzaPedido3.divisao = 3
        pizzaPedido3.quantidade = 1
        listaPizzasPedidos.append(pizzaPedido3)
        pedido1.valorTotal += (pizzaPedido3.pizza?.valor)!
        
        listaPedidos.append(pedido1)
        
        
        pedido2.dataHora = Date()
        pedido2.cliente = listaClientes[1]
        
        pizzaPedido4.pedido = pedido2
        pizzaPedido4.pizza = self.listaPizzas[0]
        pizzaPedido4.nPizza = 2
        pizzaPedido4.divisao = 1
        pizzaPedido4.quantidade = 1
        listaPizzasPedidos.append(pizzaPedido4)
        pedido2.valorTotal += (pizzaPedido4.pizza?.valor)!
        
        listaPedidos.append(pedido2)
    }
}
