//
//  Agent.swift
//  SwiftradersUI
//
//  Created by Emanuel Seemann on 29.06.23.
//

import Foundation

struct RawAgent: Hashable, Decodable {
    struct Data : Hashable, Decodable {
        var accountId : String
        var symbol : String
        var headquarters : String
        var credits : Int64
        var startingFaction : String
    }
    
    var data : Data
}

struct Agent: Hashable, Decodable {
    var accountId : String
    var symbol : String
    var headquarters : String
    var credits : Int64
    var startingFaction : String
    
    init() {
        accountId = "None"
        symbol = "None"
        headquarters = "None"
        credits = 0
        startingFaction = "None"
    }
    
    init(from decoder: Decoder) throws {
        let rawAgent = try RawAgent(from: decoder)
        
        accountId = rawAgent.data.accountId
        symbol = rawAgent.data.symbol
        headquarters = rawAgent.data.headquarters
        credits = rawAgent.data.credits
        startingFaction = rawAgent.data.startingFaction
    }
}
