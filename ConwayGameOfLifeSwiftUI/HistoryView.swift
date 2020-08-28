//
//  HistoryView.swift
//  ConwayGameOfLifeSwiftUI
//
//  Created by Vici Shaweddy on 8/25/20.
//

import SwiftUI

struct History: View {
    var body: some View {
        ScrollView {
            Text("In 1970, John Conway invented the Game of Life, a single-person logic game played on a grid of square cells. From an initial starting configuration of live cells chosen by the player, every generation after that is determined on the basis of four rules that are applied to all cells in the game at the same time.").padding(20)
        }.navigationBarTitle("History")
    }
}


struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
