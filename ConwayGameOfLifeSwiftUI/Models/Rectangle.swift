//
//  Rectangle.swift
//  ConwayGameOfLifeSwiftUI
//
//  Created by Vici Shaweddy on 8/26/20.
//

import SwiftUI

struct Rectangle: View {
    let color: Color
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 10, height: 10)
        
    }
}

struct Rectangle_Previews: PreviewProvider {
    static var previews: some View {
        Rectangle(color: .blue)
    }
}
