//
//  ContentView.swift
//  custom curves
//
//  Created by Dip Dutt on 28/3/23.
//

import SwiftUI

struct Tringle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to:CGPoint(x: rect.midX, y: rect.minY) )
            path.addLine(to:CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y:rect.maxY ))
            
        }
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Tringle()
            
                .frame(width: 200, height: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
