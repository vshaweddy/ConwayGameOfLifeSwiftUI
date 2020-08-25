//
//  AppView.swift
//  ConwayGameOfLifeSwiftUI
//
//  Created by Vici Shaweddy on 8/24/20.
//

import SwiftUI

struct AppView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ContentView()
                .onTapGesture {
                    self.selectedTab = 1
                }
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Board")
                }
                .tag(0)

            AboutView()
                .tabItem {
                    Image(systemName: "star")
                    Text("About")
                }
                .tag(1)
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
