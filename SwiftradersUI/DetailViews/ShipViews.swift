//
//  ShipViews.swift
//  SwiftradersUI
//
//  Created by Emanuel Seemann on 02.07.23.
//

import SwiftUI

struct FullShipView: View {
    var ship : Ship
    var body: some View {
        VStack {
            ShipNameView(ship: ship)
        }
    }
}

struct ShipNameView: View {
    var ship : Ship
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(ship.registration.name) (\(ship.symbol))").fontWeight(.bold).font(.title)
            HStack {
                Text(ship.registration.role).font(.title2).fontWeight(.light)
                Spacer()
                Text(ship.nav.status).font(.title2).fontWeight(.medium)
            }
            Text(ship.nav.waypointSymbol)
        }.fixedSize(horizontal: true, vertical: false)
    }
}

struct ShipViews_Previews: PreviewProvider {
    static var previews: some View {
        FullShipView(ship : Ship())
    }
}
