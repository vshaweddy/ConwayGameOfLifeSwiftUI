//
//  RulesView.swift
//  ConwayGameOfLifeSwiftUI
//
//  Created by Vici Shaweddy on 8/25/20.
//

import SwiftUI

struct Rules: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("👉🏻")
                    Text("Any live cell with two or three live neighbours survives.")
                }
                
                HStack {
                    Text("👉🏻")
                    Text("Any dead cell with three live neighbours becomes a live cell.")
                }
                
                HStack {
                    Text("👉🏻")
                    Text("All other live cells die in the next generation. Similarly, all other dead cells stay dead.")
                }
            }.lineSpacing(1.2)
        }
        .navigationBarTitle("Rules")
        .padding()
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        Rules()
    }
}
