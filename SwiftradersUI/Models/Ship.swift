//
//  Ship.swift
//  SwiftradersUI
//
//  Created by Emanuel Seemann on 01.07.23.
//

import Foundation

struct ShipList:Decodable {
    var data : [Ship] = [Ship(), Ship()]
    var meta : Meta = Meta()
}

struct Ship:Decodable, Hashable{
    var symbol : String = "shipSymbol"
    var registration : ShipRegistration = ShipRegistration()
    var nav : ShipNav = ShipNav()
    var crew : ShipCrew = ShipCrew()
    var frame : ShipFrame = ShipFrame()
    var reactor : ShipReactor = ShipReactor()
    var engine : ShipEngine = ShipEngine()
    var modules : [ShipModule] = [ShipModule(), ShipModule()]
    var mounts : [ShipMount] = [ShipMount(), ShipMount()]
    var cargo : ShipCargo = ShipCargo()
    var fuel : ShipFuel = ShipFuel()
}

struct ShipRegistration:Decodable , Hashable{
    var name : String = "shipName"
    var factionSymbol : String = "factionSymbol"
    var role : String = "shipRole"
}

struct ShipNav:Decodable , Hashable{
    var systemSymbol : String = "systemSymbol"
    var waypointSymbol: String = "waypointSymbol"
    var route : ShipNavRoute = ShipNavRoute()
    var status : String = "status"
    var flightMode : String = "flightMode"
}

struct ShipNavRoute:Decodable , Hashable{
    var destination : ShipNavRouteWaypoint = ShipNavRouteWaypoint()
    var departure : ShipNavRouteWaypoint = ShipNavRouteWaypoint()
    var departureTime : String = "departureTime"
    var arrival : String = "arrivalTime"
}

struct ShipNavRouteWaypoint:Decodable, Hashable {
    var symbol : String = "waypointSymbol"
    var type : String = "waypointType"
    var systemSymbol : String = "systemSymbol"
    var x : Int = 0
    var y : Int = 0
}

struct ShipCrew:Decodable , Hashable{
    var current : Int = 0
    var required : Int = 0
    var capacity : Int = 0
    var rotation : String = "rotation"
    var morale : Int = 0
    var wages : Int = 0
}

struct ShipFrame:Decodable, Hashable {
    var symbol : String = "frameSymbol"
    var name : String = "frameName"
    var description : String = "frameDescription"
    var condition : Int = 0
    var moduleSlots : Int = 0
    var mountingPoints : Int  = 0
    var fuleCapacity : Int = 0
    var requirements : ShipRequirements = ShipRequirements()
}

struct ShipRequirements:Decodable , Hashable{
    var power : Int = 0
    var crew : Int = 0
    var slots : Int = 0
}

struct ShipReactor:Decodable , Hashable{
    var symbol : String = "reactorSymbol"
    var name : String = "reactorName"
    var description : String = "reactorDescription"
    var condition : Int = 0
    var powerOutput : Int = 0
    var requirements : ShipRequirements = ShipRequirements()
}

struct ShipEngine:Decodable, Hashable {
    var symbol : String = "engineSymbol"
    var name : String = "engineName"
    var description : String = "engineDescription"
    var condition : Int = 0
    var speed : Int = 0
    var requirements : ShipRequirements = ShipRequirements()
}

struct ShipModule:Decodable , Hashable{
    var symbol : String = "moduleSymbol"
    var capacity : Int = 0
    var range : Int = 0
    var name : String = "moduleName"
    var description : String = "moduleDescription"
    var requirements : ShipRequirements = ShipRequirements()
}

struct ShipMount:Decodable , Hashable{
    var symbol : String = "mountSymbol"
    var name : String = "moduleName"
    var description : String = "moduleDescription"
    var strength : Int = 0
    var deposits : [String] = ["Deposit_1", "Deposit_2"]
    var requirements : ShipRequirements = ShipRequirements()
}

struct ShipCargo:Decodable , Hashable{
    var capacity : Int = 0
    var units : Int = 0
    var inventory : [ShipCargoItem] = [ShipCargoItem(), ShipCargoItem()]
}

struct ShipCargoItem:Decodable , Hashable{
    var symbol : String = "cargoSymbol"
    var name : String = "cargoName"
    var description : String = "cargoDescription"
    var units : Int = 0
}

struct ShipFuel:Decodable , Hashable{
    var current : Int = 0
    var capacity : Int = 0
    var consumed : ConsumedFuel = ConsumedFuel()
    
    struct ConsumedFuel:Decodable , Hashable{
        var amount : Int = 0
        var timestamp : String = "None"
    }
}
