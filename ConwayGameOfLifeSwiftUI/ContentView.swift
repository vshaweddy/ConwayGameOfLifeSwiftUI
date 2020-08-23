//
//  ContentView.swift
//  ConwayGameOfLifeSwiftUI
//
//  Created by Vici Shaweddy on 8/22/20.
//

import SwiftUI

struct Board {
    let rows: Int
    let cols: Int
    let allCells: [Cell]
    
    init(rows: Int, cols: Int) {
        self.rows = rows
        self.cols = cols
        
        var allCells = [Cell]()
        for row in 0..<rows {
            for col in 0..<cols {
                allCells.append(Cell(row: row, col: col))
            }
        }
        self.allCells = allCells
    }
}

extension Board {
    var columns: [GridItem] {
        [GridItem](repeating: GridItem(.fixed(20)), count: cols)
    }
}

final class Cell: Identifiable {
    enum Status {
        case alive, dead
    }
    
    // The row of the cell
    let row: Int
    
    // The col of the cell
    let col: Int
    
    // The status of the cell
    var status: Status
    
    // creating id for each cell
    var id: (Int, Int) {
        (row, col)
    }
    
    init(row: Int, col: Int) {
        self.row = row
        self.col = col
        self.status = [Cell.Status.dead, .alive].randomElement() ?? .dead
    }
}



struct CellView: View {
    let status: Cell.Status
    
    var body: some View {
        Text(status == .alive ? "🦠" : "✨")
    }
}

struct ContentView: View {
    private let board = Board(rows: 10, cols: 10)

    
    var body: some View {
        LazyVGrid(columns: board.columns) {
            ForEach(board.allCells, id: \.id) { cell in
                CellView(status: cell.status)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
