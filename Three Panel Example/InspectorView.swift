//
//  InspectorView.swift
//  Three Panel Example
//
//  Created by Daniel Jilg on 08.06.21.
//

import SwiftUI

struct InspectorView: View {
    let line: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Selected Line").font(.headline)
                    Text(line)
                        .font(.system(size: 14, design: .monospaced))
                }
            
                Divider()
            
                VStack(alignment: .leading) {
                    Text("Last Updated").font(.headline)
                    Text("Last Updated by Daniel Jilg on June 8, 2021")
                }
            
                Divider()
            
                VStack(alignment: .leading) {
                    Text("Target Membership").font(.headline)
                    Toggle(isOn: .constant(true), label: { Text("Three Panel Example") }).disabled(true)
                }
            }
        }
        .padding()
        .frame(minWidth: 200)
        .toolbar {
            ToolbarItem {
                Button(action: toggleRightSidebar) {
                    Image(systemName: "sidebar.right")
                        .help("Toggle Sidebar")
                }
            }
        }
    }
}

struct InspectorView_Previews: PreviewProvider {
    static var previews: some View {
        InspectorView(line: "// test")
    }
}
