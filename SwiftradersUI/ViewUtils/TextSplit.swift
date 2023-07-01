//
//  TextSplit.swift
//  SwiftradersUI
//
//  Created by Emanuel Seemann on 29.06.23.
//

import Foundation
import SwiftUI


struct TextSplit:View {
    let key : String
    let value : String
    
    var body: some View {
        HStack() {
                Text(key)
            Spacer()
            Text(value)
            }      }
}


struct TextSplit_Previews: PreviewProvider {
    static var previews: some View {
        TextSplit(key: "key", value: "value")
    }
}
