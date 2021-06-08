//
//  MainView.swift
//  Three Panel Example
//
//  Created by Daniel Jilg on 08.06.21.
//

import SwiftUI

struct MainView: View {
    let fileName: String

    var codelines: [String] {
        """
        //
        //  \(fileName)
        //  Three Panel Example
        //
        //  Created by Daniel Jilg on 08.06.21.
        //
        
        struct \(fileName.components(separatedBy: ".swift").first?.capitalized ?? "View"): View {
            let fileName: String
        
            var body: some View {
                // ...
            }
        }
        """
        .components(separatedBy: "\n")
    }

    var body: some View {
        List {
            ForEach(codelines, id: \.self) { line in
                NavigationLink(
                    destination: InspectorView(line: line),
                    label: {
                        Text(line)
                    }
                )
            }
        }
        .navigationTitle(fileName)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(fileName: "test.swift")
    }
}
