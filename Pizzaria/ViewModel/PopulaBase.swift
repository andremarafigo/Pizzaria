//
//  PopulaBase.swift
//  Pizzaria
//
//  Created by ALUNO on 18/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//
/*
import Foundation
import CoreData
import UIKit

class PopulaBase {
//    var contexto = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
//    var listaClientes: [Cliente]
//    var listaEnderecos: [Endereco]
//    var listaTelefones: [Telefone]
//    var listaPizzas: [Pizza]
//    var listaPedidos: [Pedido]
//    var listaPizzasPedidos: [PizzasPedido]
    
    var telaInicial: ViewController?
    
    init(telaInicial: ViewController) {
//        listaClientes = [Cliente]()
//        listaEnderecos = [Endereco]()
//        listaTelefones = [Telefone]()
//        listaPizzas = [Pizza]()
//        listaPedidos = [Pedido]()
//        listaPizzasPedidos = [PizzasPedido]()
        self.telaInicial = telaInicial
        
        
      //  do
        //{
        
            //telaInicial.listaClientes = telaInicial.contexto.fetch(telaInicial.requestCliente)
        //catch
        //{
          //  print("There was something wrong")
        //}
        criaClientes()
        criaEnderecos()
        criaTelefones()
        criaPizzas()
        criaPedidos()
    }
    
    func criaClientes() {
        let cliente1: Cliente = Cliente(context: telaInicial!.contexto)
        cliente1.cpf = "111.111.111-11"
        cliente1.nome = "André Marafigo"
        //telaInicial.listaClientes.append(cliente)
        
        let cliente2: Cliente = Cliente(context: telaInicial!.contexto)
        cliente2.cpf = "222.222.222-22"
        cliente2.nome = "João"
        //listaClientes.append(cliente)

        let cliente3: Cliente = Cliente(context: telaInicial!.contexto)
        cliente3.cpf = "333.333.333-33"
        cliente3.nome = "Frederico"
        //listaClientes.append(cliente)
        
        let cliente4: Cliente = Cliente(context: telaInicial!.contexto)
        cliente4.cpf = "444.444.444-44"
        cliente4.nome = "Pedro"
        //listaClientes.append(cliente)

        let cliente5: Cliente = Cliente(context: telaInicial!.contexto)
        cliente5.cpf = "555.555.555-55"
        cliente5.nome = "Paulo"
        //listaClientes.append(cliente)

        do{
            try telaInicial!.contexto.save()
        }catch{
            print("There was something wrong")
        }
    }
    
    func criaEnderecos() {
        let endereço1: Endereco = Endereco(context: telaInicial!.contexto)
        endereço1.cliente = telaInicial!.listaClientes[0]
        endereço1.cep = "111111-111"
        endereço1.nome_rua = "Rua 01"
        endereço1.numero = 1
        //listaEnderecos.append(endereço)
        
        let endereço2: Endereco = Endereco(context: telaInicial!.contexto)
        endereço2.cliente = telaInicial!.listaClientes[1]
        endereço2.cep = "222222-222"
        endereço2.nome_rua = "Rua 02"
        endereço2.numero = 2
        //listaEnderecos.append(endereço)
        
        let endereço3: Endereco = Endereco(context: telaInicial!.contexto)
        endereço3.cliente = telaInicial!.listaClientes[2]
        endereço3.cep = "333333-333"
        endereço3.nome_rua = "Rua 03"
        endereço3.numero = 3
        //listaEnderecos.append(endereço)
        
        let endereço4: Endereco = Endereco(context: telaInicial!.contexto)
        endereço4.cliente = telaInicial!.listaClientes[3]
        endereço4.cep = "444444-444"
        endereço4.nome_rua = "Rua 04"
        endereço4.numero = 4
        //listaEnderecos.append(endereço)
        
        let endereço5: Endereco = Endereco(context: telaInicial!.contexto)
        endereço5.cliente = telaInicial!.listaClientes[4]
        endereço5.cep = "555555-555"
        endereço5.nome_rua = "Rua 05"
        endereço5.numero = 5
        //listaEnderecos.append(endereço)
        
        do{
            try telaInicial!.contexto.save()
        }catch{
            print("There was something wrong")
        }
    }
    
    func criaTelefones() {
        let telefone1: Telefone = Telefone(context: telaInicial!.contexto)
        telefone1.cliente = telaInicial!.listaClientes[0]
        telefone1.ddi = 55
        telefone1.ddd = 41
        telefone1.numero = "99999-0001"
        //listaTelefones.append(telefone1)
        
        let telefone2: Telefone = Telefone(context: telaInicial!.contexto)
        telefone2.cliente = telaInicial!.listaClientes[1]
        telefone2.ddi = 55
        telefone2.ddd = 41
        telefone2.numero = "99999-0002"
        //listaTelefones.append(telefone)
        
        let telefone3: Telefone = Telefone(context: telaInicial!.contexto)
        telefone3.cliente = telaInicial!.listaClientes[2]
        telefone3.ddi = 55
        telefone3.ddd = 41
        telefone3.numero = "99999-0003"
        //listaTelefones.append(telefone)
        
        let telefone4: Telefone = Telefone(context: telaInicial!.contexto)
        telefone4.cliente = telaInicial!.listaClientes[3]
        telefone4.ddi = 55
        telefone4.ddd = 41
        telefone4.numero = "99999-0004"
        //listaTelefones.append(telefone)
        
        let telefone5: Telefone = Telefone(context: telaInicial!.contexto)
        telefone5.cliente = telaInicial!.listaClientes[4]
        telefone5.ddi = 55
        telefone5.ddd = 41
        telefone5.numero = "99999-0005"
        //listaTelefones.append(telefone)
        
        do{
            try telaInicial!.contexto.save()
        }catch{
            print("There was something wrong")
        }
    }
    
    func criaPizzas() {
        let pizza1: Pizza = Pizza(context: telaInicial!.contexto)
        pizza1.sabor = "Quatro Queijo"
        pizza1.tamanho = "M"
        pizza1.valor = 20.00
        //listaPizzas.append(pizza)
        
        let pizza2 = Pizza(context: telaInicial!.contexto)
        pizza2.sabor = "Quatro Queijo"
        pizza2.tamanho = "G"
        pizza2.valor = 30.00
        //listaPizzas.append(pizza)
        
        let pizza3 = Pizza(context: telaInicial!.contexto)
        pizza3.sabor = "Quatro Queijo"
        pizza3.tamanho = "GG"
        pizza3.valor = 40.00
        //listaPizzas.append(pizza)
        
        let pizza4 = Pizza(context: telaInicial!.contexto)
        pizza4.sabor = "Calabresa"
        pizza4.tamanho = "M"
        pizza4.valor = 20.00
        //listaPizzas.append(pizza)
        
        let pizza5 = Pizza(context: telaInicial!.contexto)
        pizza5.sabor = "Calabresa"
        pizza5.tamanho = "G"
        pizza5.valor = 30.00
        //listaPizzas.append(pizza)
        
        let pizza6 = Pizza(context: telaInicial!.contexto)
        pizza6.sabor = "Calabresa"
        pizza6.tamanho = "GG"
        pizza6.valor = 40.00
        //listaPizzas.append(pizza)
        
        let pizza7 = Pizza(context: telaInicial!.contexto)
        pizza7.sabor = "Frango com Catupiry"
        pizza7.tamanho = "M"
        pizza7.valor = 20.00
        //listaPizzas.append(pizza)
        
        let pizza8 = Pizza(context: telaInicial!.contexto)
        pizza8.sabor = "Frango com Catupiry"
        pizza8.tamanho = "G"
        pizza8.valor = 30.00
        //listaPizzas.append(pizza)
        
        let pizza9 = Pizza(context: telaInicial!.contexto)
        pizza9.sabor = "Frango com Catupiry"
        pizza9.tamanho = "GG"
        pizza9.valor = 40.00
        //listaPizzas.append(pizza)
        
        do{
            try telaInicial!.contexto.save()
        }catch{
            print("There was something wrong")
        }
    }
    
    func criaPedidos() {
        let pedido1: Pedido = Pedido(context: telaInicial!.contexto)
        let pizzaPedido1: PizzasPedido = PizzasPedido(context: telaInicial!.contexto)
        
        pedido1.dataHora = Date()
        pedido1.cliente = telaInicial!.listaClientes[0]
        
        pizzaPedido1.pedido = pedido1
        pizzaPedido1.pizza = telaInicial!.listaPizzas[0]
        pizzaPedido1.nPizza = 1
        pizzaPedido1.divisao = 3
        pizzaPedido1.quantidade = 1
        telaInicial!.listaPizzasPedidos.append(pizzaPedido1)
        pedido1.valorTotal += ((pizzaPedido1.pizza?.valor)! / Double(pizzaPedido1.divisao))
        
        let pizzaPedido2: PizzasPedido = PizzasPedido(context: telaInicial!.contexto)
        pizzaPedido2.pedido = pedido1
        pizzaPedido2.pizza = telaInicial!.listaPizzas[1]
        pizzaPedido2.nPizza = 1
        pizzaPedido2.divisao = 3
        pizzaPedido2.quantidade = 1
        telaInicial!.listaPizzasPedidos.append(pizzaPedido2)
        pedido1.valorTotal += ((pizzaPedido2.pizza?.valor)! / Double(pizzaPedido2.divisao))
        
        
        let pizzaPedido3: PizzasPedido = PizzasPedido(context: telaInicial!.contexto)
        pizzaPedido3.pedido = pedido1
        pizzaPedido3.pizza = telaInicial!.listaPizzas[2]
        pizzaPedido3.nPizza = 1
        pizzaPedido3.divisao = 3
        pizzaPedido3.quantidade = 1
        telaInicial!.listaPizzasPedidos.append(pizzaPedido3)
        pedido1.valorTotal += ((pizzaPedido3.pizza?.valor)! / Double(pizzaPedido3.divisao))
        
        
        let pedido2: Pedido = Pedido(context: telaInicial!.contexto)
        let pizzaPedido4: PizzasPedido = PizzasPedido(context: telaInicial!.contexto)
        
        //pedido2 = Pedido(context: telaInicial!.contexto)
        pedido2.dataHora = Date()
        pedido2.cliente = telaInicial!.listaClientes[1]
        
        pizzaPedido4.pedido = pedido2
        pizzaPedido4.pizza = telaInicial!.listaPizzas[0]
        pizzaPedido4.nPizza = 2
        pizzaPedido4.divisao = 1
        pizzaPedido4.quantidade = 1
        telaInicial!.listaPizzasPedidos.append(pizzaPedido4)
        pedido2.valorTotal += ((pizzaPedido4.pizza?.valor)! / Double(pizzaPedido4.divisao))
        //listaPedidos.append(pedido)
        
        do{
            try telaInicial!.contexto.save()
        }catch{
            print("There was something wrong")
        }
    }
}
*/
