//
//  ContentView.swift
//  SwiftradersUI
//
//  Created by Emanuel Seemann on 29.06.23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network : Network
    var body: some View {
        VStack {
            Section("Agents") {
                AgentMiniView(agent: network.agent)
            }.onAppear {
                network.getAgents()
            }.padding()
            Section("Contracts") {
                ForEach(network.contractList.data, id: \.self) {contract in
                    VStack {
                        NavigationStack {
                            ContractDetail(contract: contract).navigationTitle(contract.id)
                        }
                    }
                }
            }.onAppear() {
                network.listContracts()
            }.padding()
            Section("Ships") {
                ForEach(network.shipList.data, id: \.self) {ship in
                    VStack {
                        NavigationStack {
                            FullShipView(ship: ship)
                        }
                    }
                }
            }.onAppear() {
                network.listShips()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var network = Network()
    static var previews: some View {
        ContentView().environmentObject(network)
    }
}
