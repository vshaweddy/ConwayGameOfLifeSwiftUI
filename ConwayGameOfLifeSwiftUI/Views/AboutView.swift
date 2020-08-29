//
//  AboutView.swift
//  ConwayGameOfLifeSwiftUI
//
//  Created by Vici Shaweddy on 8/24/20.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        
        NavigationView {
            List {
                NavigationLink(
                    destination: Rules(),
                    label: {
                        Text("Rules")
                    })
                
                NavigationLink(
                    destination: History(),
                    label: {
                        Text("History")
                    })
            }.navigationBarTitle(Text("About"))
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AboutView()
        }
    }
}
