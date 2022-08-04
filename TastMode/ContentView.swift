//
//  ContentView.swift
//  TastMode
//
//  Created by Que on 2022/7/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .featured           //默认TabView的第一个视图是 标识符为featured的视图

    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
  
        //选择卡视图TabView
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)          //标识符tag
                
        
            TestImageView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
