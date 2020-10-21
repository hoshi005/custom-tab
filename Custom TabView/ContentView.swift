//
//  ContentView.swift
//  Custom TabView
//
//  Created by Susumu Hoshikawa on 2020/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum TabItem: String, CaseIterable {
    case piyo
    case pen
    case neko
    case tobipen
    
    var name: String {
        "\(self.rawValue).gif"
    }
}
