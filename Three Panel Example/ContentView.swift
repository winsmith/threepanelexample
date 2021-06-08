//
//  ContentView.swift
//  Three Panel Example
//
//  Created by Daniel Jilg on 08.06.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            LeftSidebarView()

            Text("Please select a file")
            Text("Select a line to inspect it")
                .padding()
                .frame(minWidth: 100)
        }
        .onAppear {
            setupSidebars()
        }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
