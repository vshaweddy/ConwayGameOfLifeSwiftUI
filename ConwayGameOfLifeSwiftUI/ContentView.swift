//
//  ContentView.swift
//  ConwayGameOfLifeSwiftUI
//
//  Created by Vici Shaweddy on 8/22/20.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var board = Board(rows: 25, cols: 25)
    
    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: board.columns, spacing: 5) {
                    ForEach(board.allCells, id: \.id) { cell in
                        CellView(status: cell.status)
                    }
                }
                
                Button(action: {
                    board.start()
                }, label: {
                    Text(board.isRunning ? "Reset" : "Start")
                })
                .padding()
            }.navigationBarTitle(Text("Game of Life"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
