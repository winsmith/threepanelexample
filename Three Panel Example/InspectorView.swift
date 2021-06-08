//
//  InspectorView.swift
//  Three Panel Example
//
//  Created by Daniel Jilg on 08.06.21.
//

import SwiftUI

struct InspectorView: View {
    let line: String
    
    var randomInt: Int {
        return Int.random(in: 83...84914)
    }
    
    var body: some View {
        VStack {
            Text(line)
            Divider()
            Text("Last Updated by user \(randomInt)")
        }
        .padding()
        .frame(minWidth: 100)
    }
}

struct InspectorView_Previews: PreviewProvider {
    static var previews: some View {
        InspectorView(line: "// test")
    }
}
