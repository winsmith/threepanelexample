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
        "looksjustlikexcode.swift"
    ]

    var body: some View {
        List {
            Section(header: Text("My Project")) {
                ForEach(fileNames, id: \.self) { fileName in
                    NavigationLink(
                        destination: CodeView(fileName: fileName),
                        label: {
                            Label(fileName, systemImage: "swift")
                        }
                    )
                }
            }
        }
        .toolbar {
            ToolbarItemGroup {
                Button(action: toggleSidebar) {
                    Image(systemName: "sidebar.left")
                }
            }
        }
    }

    /// Toggle the left sidebar on or off
    ///
    /// This method is pretty hacky and I wish there was a SwiftUI equivalent where I
    /// didn't have to dive through the responder chain.
    private func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?
            .tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}

struct LeftSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        LeftSidebarView()
    }
}
