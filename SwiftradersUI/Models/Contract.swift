//
//  Contract.swift
//  SwiftradersUI
//
//  Created by Emanuel Seemann on 29.06.23.
//

import Foundation

struct ContractDeliverGood:Decodable,Hashable {
    var tradeSymbol : String = "tradeSymbol"
    var destinationSymbol : String = "destinationSymbol"
    var unitsRequired : Int = 0
    var unitsFulfilled : Int = 0
}

struct ContractPayment:Decodable, Hashable {
    var onAccepted : Int = 0
    var onFulfilled : Int = 0
}

struct ContractTerms:Decodable, Hashable {
    var deadline : String = "None"
    var payment : ContractPayment = ContractPayment()
    var deliver : [ContractDeliverGood] = [ContractDeliverGood()]
}

struct Contract:Decodable, Identifiable, Hashable{
    var id : String = "0"
    var factionSymbol : String = "None"
    var type : String = "None"
    var terms : ContractTerms = ContractTerms()
    var accepted : Bool = false
    var fulfilled : Bool = false
    var deadlineToAccept : String = "None"
}


struct ContractList:Decodable{
    
    var data : [Contract] = [Contract()]
    
    struct Meta: Decodable {
        var total : Int = 0
        var page : Int = 0
        var limit : Int = 0
    }
}
