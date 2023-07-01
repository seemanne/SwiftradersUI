//
//  AgentViews.swift
//  SwiftradersUI
//
//  Created by Emanuel Seemann on 01.07.23.
//

import SwiftUI

struct AgentFullView: View {
    var agent : Agent
    
    var body: some View {
        HStack(alignment:.top) {
            Text("\(agent.accountId)")
            
            VStack(alignment: .leading) {
                Text(agent.symbol)
                    .bold()
                Text(agent.headquarters.lowercased())
                
            }
        }
    }
}

struct AgentMiniView: View {
    var agent : Agent
    
    var body: some View {
        VStack(alignment: .leading) {
                Text(agent.symbol).font(.title).fontWeight(.bold)
            HStack {
                Text(agent.headquarters).foregroundColor(.gray)
                Text(String(agent.credits)).fontWeight(.semibold)
            }
        }
    }
}

struct AgentViews_Previews: PreviewProvider {
    static var previews: some View {
        AgentFullView(agent:Agent())
        AgentMiniView(agent:Agent())
    }
}
