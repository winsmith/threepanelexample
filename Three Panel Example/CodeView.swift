//
//  CodeView.swift
//  Three Panel Example
//
//  Created by Daniel Jilg on 08.06.21.
//

import SwiftUI

struct CodeLine: Identifiable {
    var id: Int
    var text: String
}

struct CodeView: View {
    let fileName: String

    var codelines: [CodeLine] {
        """
        //
        //  \(fileName)
        //  Three Panel Example
        //  Created by Daniel Jilg on 08.06.21.
        //

        /// This project shows a macOS app that has both a left sidebar, and a right sidebar.
        ///
        /// Navigation flows from left to right, just as with any split view. However, unlike
        /// most apps that use the three-pane layout, it is important to me that the left and
        /// right sidebars are smaller than the main content view in the center.
        ///
        /// This way, the content of the middle pane is the most important, with the rightmost
        /// sidebar a sort of inspector to change details of my selection without using up too
        /// much space.
        ///
        /// This example project uses a lot of unsafe introspection to approximate my goal: A
        /// three-pane layout just like the one in Xcode, with toggleable sidebars. My hope is
        /// that the SwiftUI team will find a more elegant solution.
        ///
        /// Toggling the left pane off or on needs introspection into NSApp.keyWindow and
        /// NSSplitViewItems, which is clunky and might be unsafe. I'd love a direct way to
        /// access that from SwiftUI instead. (See LeftSidebarView.swift)
        ///
        /// Toggling the right pane on or off is even more hacky: It requires a deep dive down
        /// the responder chain with class comparison and optional casting and depends on the
        /// way that NSSplitViewController structures its subviews. It would be really cool to
        /// be able to do that directly from SwiftUI. (See View+toggleSidebar.swift)
        ///
        /// Minor Comments and improvement suggestions:
        ///
        /// - Toggling the right pane off and then on again has a missing animation.
        /// - I have to duplicate the right toolbar button so it shows up at the right spot
        ///   all the time. I wish I could just provide it once.
        /// - Placement of the left toolbar button jumps around a lot, and when I toggle it,
        ///   it sometimes disappears.

        struct \(fileName.components(separatedBy: ".swift").first?.capitalized ?? "View"): View {
            let fileName: String
            var body: some View {
                // ...
            }
        }
        """
        .components(separatedBy: "\n")
        .enumerated()
        .map { s in CodeLine(id: s.offset, text: s.element) }
    }

    var body: some View {
        List {
            ForEach(codelines) { line in
                NavigationLink(
                    destination: InspectorView(line: line.text),
                    label: {
                        Text(line.text)
                            .font(.system(size: 12, design: .monospaced))
                            .foregroundColor(line.text.trimmingCharacters(in: .whitespacesAndNewlines).starts(with: "//") ? .secondary : .primary)
                    }
                )
            }
        }
        .navigationTitle(fileName)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        CodeView(fileName: "test.swift")
    }
}
