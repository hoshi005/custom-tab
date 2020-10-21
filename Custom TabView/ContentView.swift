//
//  ContentView.swift
//  Custom TabView
//
//  Created by Susumu Hoshikawa on 2020/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    // タブの選択値と初期値.
    @State private var selected: TabItem = .piyo
    
    var body: some View {
        
        // タブビュー部分.
        HStack {
            ForEach(TabItem.allCases, id: \.self) { tabItem in
                TabItemView(tabItem: tabItem, selected: $selected)
            }
        }
        .padding(.vertical, 10.0)
        .padding(.horizontal, 20.0)
        .background(Color.white.clipShape(Capsule()))
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: -5, y: 5)
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
