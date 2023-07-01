//
//  SwiftradersUIApp.swift
//  SwiftradersUI
//
//  Created by Emanuel Seemann on 29.06.23.
//

import SwiftUI

@main
struct SwiftradersUIApp: App {
    
    var network = Network()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(network)
        }
    }
}
