//
//  AboutView.swift
//  ConwayGameOfLifeSwiftUI
//
//  Created by Vici Shaweddy on 8/24/20.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("Rules")
                .font(.title)
            Text("Any dead cell with exactly three neighbours becomes alive")
            Text("Any live cell with more than 3 or less than 2 neighbours dies, due to overcrowding or loneliness respectively")
                
            Text("About")
                .font(.title)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
