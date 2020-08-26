//
//  ContentView.swift
//  ConwayGameOfLifeSwiftUI
//
//  Created by Vici Shaweddy on 8/22/20.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var board = Board(rows: 10, cols: 10)
    
    var body: some View {
        VStack {
            LazyVGrid(columns: board.columns) {
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
