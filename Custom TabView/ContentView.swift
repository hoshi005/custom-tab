//
//  ContentView.swift
//  Custom TabView
//
//  Created by Susumu Hoshikawa on 2020/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        Group {
            TabItemView(tabItem: .piyo, selected: .constant(.piyo))
            TabItemView(tabItem: .pen, selected: .constant(.piyo))
        }
        .previewLayout(.fixed(width: 200, height: 200))
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

struct TabItemView: View {
    
    let tabItem: TabItem
    @Binding var selected: TabItem
    
    var body: some View {
        AnimatedImage(name: tabItem.name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40)
            .onTapGesture {
                selected = tabItem // タップしたら自身をselectedに.
            }
    }
}
