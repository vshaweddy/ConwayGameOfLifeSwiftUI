//
//  Cell.swift
//  ConwayGameOfLifeSwiftUI
//
//  Created by Vici Shaweddy on 8/23/20.
//

import SwiftUI

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
    
    init(row: Int, col: Int, status: Status) {
        self.row = row
        self.col = col
        self.status = status
    }
}

struct CellView: View {
    let status: Cell.Status
    
    var body: some View {
        Rectangle(color: status == .alive ? Color.red : .blue)
    }
}
