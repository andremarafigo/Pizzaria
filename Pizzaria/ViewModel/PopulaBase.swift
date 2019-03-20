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
        let cliente: Cliente = Cliente(context: contexto)

        cliente.cpf = "111.111.111-11"
        cliente.nome = "André Marafigo"
        listaClientes.append(cliente)
        
        cliente.cpf = "222.222.222-22"
        cliente.nome = "João"
        listaClientes.append(cliente)
        /*
        cliente.cpf = "333.333.333-33"
        cliente.nome = "Frederico"
        listaClientes.clientes.append(cliente)
        
        cliente.cpf = "444.444.444-44"
        cliente.nome = "Pedro"
        listaClientes.clientes.append(cliente)
        
        cliente.cpf = "555.555.555-55"
        cliente.nome = "Paulo"
        listaClientes.clientes.append(cliente)*/
    }
    
    func criaEnderecos() {
        let endereço: Endereco = Endereco(context: contexto)

        endereço.cliente = listaClientes[0]
        endereço.cep = "111111-111"
        endereço.nome_rua = "Rua 01"
        endereço.numero = 1
        listaEnderecos.append(endereço)
        
        endereço.cliente = listaClientes[1]
        endereço.cep = "222222-222"
        endereço.nome_rua = "Rua 02"
        endereço.numero = 2
        listaEnderecos.append(endereço)
        /*
        endereço.cliente = listaClientes.clientes[2]
        endereço.cep = "333333-333"
        endereço.nome_rua = "Rua 03"
        endereço.numero = 3
        listaEnderecos.endereços.append(endereço)
        
        endereço.cliente = listaClientes.clientes[3]
        endereço.cep = "444444-444"
        endereço.nome_rua = "Rua 04"
        endereço.numero = 4
        listaEnderecos.endereços.append(endereço)
        
        endereço.cliente = listaClientes.clientes[4]
        endereço.cep = "555555-555"
        endereço.nome_rua = "Rua 05"
        endereço.numero = 5
        listaEnderecos.endereços.append(endereço)*/
    }
    
    func criaTelefones() {
        let telefone: Telefone = Telefone(context: contexto)
        
        telefone.cliente = listaClientes[0]
        telefone.ddi = 55
        telefone.ddd = 41
        telefone.numero = "99999-0001"
        listaTelefones.append(telefone)
        
        telefone.cliente = listaClientes[1]
        telefone.ddi = 55
        telefone.ddd = 41
        telefone.numero = "99999-0002"
        listaTelefones.append(telefone)
        /*
        telefone.cliente = listaClientes.clientes[2]
        telefone.ddi = 55
        telefone.ddd = 41
        telefone.numero = "99999-0003"
        listaTelefones.telefones.append(telefone)
        
        telefone.cliente = listaClientes.clientes[3]
        telefone.ddi = 55
        telefone.ddd = 41
        telefone.numero = "99999-0004"
        listaTelefones.telefones.append(telefone)
        
        telefone.cliente = listaClientes.clientes[4]
        telefone.ddi = 55
        telefone.ddd = 41
        telefone.numero = "99999-0005"
        listaTelefones.telefones.append(telefone)*/
    }
    
    func criaPizzas() {
        let pizza: Pizza = Pizza(context: contexto)
        
        pizza.sabor = "Quatro Queijo"
        pizza.tamanho = "M"
        pizza.valor = 20.00
        listaPizzas.append(pizza)
        
        pizza.sabor = "Quatro Queijo"
        pizza.tamanho = "G"
        pizza.valor = 30.00
        listaPizzas.append(pizza)
        
        pizza.sabor = "Quatro Queijo"
        pizza.tamanho = "GG"
        pizza.valor = 40.00
        listaPizzas.append(pizza)
        
        pizza.sabor = "Calabresa"
        pizza.tamanho = "M"
        pizza.valor = 20.00
        listaPizzas.append(pizza)
        
        pizza.sabor = "Calabresa"
        pizza.tamanho = "G"
        pizza.valor = 30.00
        listaPizzas.append(pizza)
        
        pizza.sabor = "Calabresa"
        pizza.tamanho = "GG"
        pizza.valor = 40.00
        listaPizzas.append(pizza)
        
        pizza.sabor = "Frango com Catupiry"
        pizza.tamanho = "M"
        pizza.valor = 20.00
        listaPizzas.append(pizza)
        
        pizza.sabor = "Frango com Catupiry"
        pizza.tamanho = "G"
        pizza.valor = 30.00
        listaPizzas.append(pizza)
        
        pizza.sabor = "Frango com Catupiry"
        pizza.tamanho = "GG"
        pizza.valor = 40.00
        listaPizzas.append(pizza)
    }
    
    func criaPedidos() {
        let pedido: Pedido = Pedido(context: contexto)
        let pizzaPedido: PizzasPedido = PizzasPedido(context: contexto)
        
        pedido.dataHora = Date()
        pedido.cliente = listaClientes[0]
        
        pizzaPedido.pedido = pedido
        pizzaPedido.pizza = self.listaPizzas[0]
        pizzaPedido.nPizza = 1
        pizzaPedido.divisao = 3
        pizzaPedido.quantidade = 1
        listaPizzasPedidos.append(pizzaPedido)
        pedido.valorTotal += (pizzaPedido.pizza?.valor)!
        
        pizzaPedido.pedido = pedido
        pizzaPedido.pizza = self.listaPizzas[1]
        pizzaPedido.nPizza = 1
        pizzaPedido.divisao = 3
        pizzaPedido.quantidade = 1
        listaPizzasPedidos.append(pizzaPedido)
        pedido.valorTotal += (pizzaPedido.pizza?.valor)!
        
        pizzaPedido.pedido = pedido
        pizzaPedido.pizza = listaPizzas[2]
        pizzaPedido.nPizza = 1
        pizzaPedido.divisao = 3
        pizzaPedido.quantidade = 1
        listaPizzasPedidos.append(pizzaPedido)
        pedido.valorTotal += (pizzaPedido.pizza?.valor)!
        
        listaPedidos.append(pedido)
        
        
        pedido.dataHora = Date()
        pedido.cliente = listaClientes[1]
        
        pizzaPedido.pedido = pedido
        pizzaPedido.pizza = self.listaPizzas[0]
        pizzaPedido.nPizza = 2
        pizzaPedido.divisao = 1
        pizzaPedido.quantidade = 1
        listaPizzasPedidos.append(pizzaPedido)
        pedido.valorTotal += (pizzaPedido.pizza?.valor)!
        
        listaPedidos.append(pedido)
    }
}
