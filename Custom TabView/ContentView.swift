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
        
        ZStack {
            
            // 背景色.
            Color("bg").ignoresSafeArea()
            
            VStack {
                
                Spacer(minLength: 0)
                
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
            // 選択状態によって、サイズや間隔を調整する.
            .frame(width: tabItem == selected ? 100 : 40)
            .padding(.vertical, tabItem == selected ? -30 : 0)
            .padding(.horizontal, tabItem == selected ? -14 : 16)
            .offset(y: tabItem == selected ? -15 : 0)
            .onTapGesture {
                withAnimation(.spring()) {
                    selected = tabItem // タップしたら自身をselectedに.
                }
            }
    }
}


// MARK: - ダミーの画面たち

struct HomeView: View {
    var body: some View {
        Text("Home")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(.red)
    }
}

struct ListView: View {
    var body: some View {
        Text("List")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(.green)
    }
}

struct SearchView: View {
    var body: some View {
        Text("Search")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(.blue)
    }
}

struct SettingView: View {
    var body: some View {
        Text("Setting")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(.yellow)
    }
}
