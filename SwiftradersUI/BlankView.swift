//
//  BlankView.swift
//  SwiftradersUI
//
//  Created by Emanuel Seemann on 29.06.23.
//

import Foundation
import SwiftUI

struct BlankView:View {
    var body: some View {
            Text("this is blank")
            .padding().toolbar {
                ToolbarItem {
                    NavigationLink("Delete Creature"){
                        ContentView().navigationTitle("Creature Editor")
                    }
                }
            }        }
}
