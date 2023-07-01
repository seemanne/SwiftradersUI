//
//  ContractViews.swift
//  SwiftradersUI
//
//  Created by Emanuel Seemann on 29.06.23.
//

import Foundation
import SwiftUI

struct ContractDetail:View {
    let contract : Contract
    @EnvironmentObject var network : Network
    @State var scale : Bool = true
    
    var body: some View {
        HStack {
                VStack {
                    Text("Contract".uppercased()).fontWeight(.bold).font(.title).padding(1)
                    VStack(alignment: .leading) {
                        TextSplit(key: "Faction", value: contract.factionSymbol)
                        TextSplit(key: "Type: ", value: contract.type)
                        TextSplit(key: "Accepted: ", value: String(contract.accepted))
                        TextSplit(key: "Fulfilled: ", value: String(contract.fulfilled))
                        TextSplit(key: "Deadline: ", value: contract.deadlineToAccept)
                    }
                    Spacer()
                    HStack(alignment: .center) {
                        Button("Accept") {
                            network.acceptContract(contractId: contract.id)
                        }.scaledToFill()
                    }
                    
                }.padding(16).frame(maxHeight: .infinity).background(Color.accentColor)
            VStack{
                Text("Delivery".uppercased()).fontWeight(.bold).font(.title).padding(1)
                ForEach(contract.terms.deliver, id: \.self) { deliver in
                    DeliverGoodView(deliver: deliver, contractId: contract.id)
                }
            }.padding(16).frame(maxHeight: .infinity).background(Color.gray)
            VStack{
                    Text("Terms".uppercased()).fontWeight(.bold).font(.title).padding(1)
                TermsView(terms: contract.terms, contractId: contract.id)
                }.padding(16).frame(maxHeight: .infinity).background(Color.red)

            
        }.clipShape(Capsule()).fixedSize(horizontal: false, vertical: true)
    }
}

struct TermsView: View {
    @EnvironmentObject var network : Network
    var terms : ContractTerms
    var contractId : String

    var body: some View {
        VStack {
            TextSplit(key: "Deadline: ", value: terms.deadline)
            TextSplit(key: "on Accept", value: String(terms.payment.onAccepted))
            TextSplit(key: "on Fulfilled", value: String(terms.payment.onFulfilled))
            Spacer()
            Button("Fulfill contract") {
                network.deliverCargoContract(contractId: contractId)
            }
        }
    }
}

struct DeliverGoodView: View {
    @EnvironmentObject var network : Network
    var deliver : ContractDeliverGood
    var contractId : String
    
    var body: some View {
        VStack {
            TextSplit(key: "Product: ", value: deliver.tradeSymbol)
            TextSplit(key: "Destination: ", value: String(deliver.destinationSymbol))
            TextSplit(key: "Required: ", value: String(deliver.unitsRequired))
            TextSplit(key: "Fulfilled: ", value: String(deliver.unitsFulfilled))
            Spacer()
            Button("Deliver ressources") {
                network.deliverCargoContract(contractId: contractId)
            }
        }
    }
}



struct ContractDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContractDetail(contract: Contract())
    }
}
