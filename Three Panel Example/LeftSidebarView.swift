//
//  LeftSidebarView.swift
//  Three Panel Example
//
//  Created by Daniel Jilg on 08.06.21.
//

import SwiftUI

struct LeftSidebarView: View {
    let fileNames: [String] = [
        "file1.swift",
        "file2.swift",
        "file3.swift",
        "docc.md"
    ]
    
    var body: some View {
        List {
            Section(header: Text("My Project")) {
                ForEach(fileNames, id: \.self) { fileName in
                    NavigationLink(
                        destination: MainView(fileName: fileName),
                        label: {
                            Label(fileName, systemImage: "swift")
                        }
                    )
                }
            }
        }
    }
}

struct LeftSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        LeftSidebarView()
    }
}
