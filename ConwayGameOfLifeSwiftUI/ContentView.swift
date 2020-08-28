//
//  ContentView.swift
//  ConwayGameOfLifeSwiftUI
//
//  Created by Vici Shaweddy on 8/22/20.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var board = Board(rows: 25, cols: 25)
    @State var value: Double = 0.5
    
    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: board.columns, spacing: 5) {
                    ForEach(board.allCells, id: \.id) { cell in
                        CellView(status: cell.status)
                    }
                }

                HStack {
                    Image(systemName: "minus")
                    Slider(value: Binding(get: {
                        self.value
                    }, set: { newValue in
                        self.value = newValue
                        self.board.createTimer(timeInterval: newValue)
                    }), in: 0...1, step: 0.1)
                        .accentColor(.green)
                    Image(systemName: "plus")
                }.padding(20).foregroundColor(.green)
                
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
