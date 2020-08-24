//
//  ContentView.swift
//  ConwayGameOfLifeSwiftUI
//
//  Created by Vici Shaweddy on 8/22/20.
//

import SwiftUI

final class Board: ObservableObject {
    let rows: Int
    let cols: Int
    let rowsOfCells: [[Cell]]
    let allCells: [Cell]
    
    private lazy var timer = Timer(timeInterval: 1.0, repeats: true) { [weak self] timer in
        // Call this every second
        self?.next()
    }
    
    init(rows: Int, cols: Int) {
        self.rows = rows
        self.cols = cols
        
        var allCells = [Cell]()
        var rowsOfCells = [[Cell]]()
        
        for row in 0..<rows {
            var tempRow = [Cell]()
            for col in 0..<cols {
                let cell = Cell(row: row, col: col)
                allCells.append(cell)
                tempRow.append(cell)
            }
            
            rowsOfCells.append(tempRow)
        }
        

        self.allCells = allCells
        self.rowsOfCells = rowsOfCells
    }
    
    func start() {
        RunLoop.current.add(timer, forMode: .common)
    }
    
    private func next() {
        let neighbors: (Cell) -> [Cell] = { [weak self] cell in
            // making sure that the weak self is no longer optional
            guard let self = self else { return [] }
            
            var neighbors = [Cell]()
            
            let row = cell.row
            let col = cell.col
            
            for r in (row - 1)...(row + 1) {
                for c in (col - 1)...(col + 1) {
                    guard !(r == row && c == col) else { continue }
                    guard r >= 0 && r < self.rows && c >= 0 && c < self.cols else { continue }
                    
                    let neighbor = self.rowsOfCells[r][c]
                    neighbors.append(neighbor)
                }
            }
            return neighbors
        }
        
        let livingNeighbors: (Cell) -> Int = { cell in
            neighbors(cell).filter { $0.status == .alive }.count
        }
        
        let liveCells = self.allCells.filter { $0.status == .alive }
        let deadCells = self.allCells.filter { $0.status != .dead}
        
        
        // If there are < 2, it will die
        // If there are > 3, it will die
        let dyingCells = liveCells.filter { cell in
            livingNeighbors(cell) < 2 || livingNeighbors(cell) > 3
        }
        
        // If there are 3 lives neighbors, it will born one
        let bornCells = deadCells.filter { cell in
            livingNeighbors(cell) == 3
        }

        dyingCells.forEach { $0.status = .dead }
        bornCells.forEach { $0.status = .alive }
        
        self.objectWillChange.send()
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
                Text("Start")
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
