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
                LazyVGrid(columns: board.columns, spacing: 4) {
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
                }.padding(10).foregroundColor(.green)
                
                Button(action: {
                    board.start()
                }, label: {
                    Text(board.isRunning ? "Reset" : "Start")
                        .fontWeight(.bold)
                        .padding()
                        .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                })
                .background(Color.yellow)
                .foregroundColor(.white)
                .cornerRadius(6.0)
            }.navigationBarTitle(Text("Game of Life")).padding(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
