//
//  ContentView.swift
//  scrollvViewReader
//
//  Created by Dip Dutt on 6/3/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                
                Button("press the button to 20") {
                    withAnimation(.spring()) {
                        proxy.scrollTo(20,anchor: .center)
                    }
                }
                
                ForEach(0..<50) { index in
                    Text("The index is \(index)")
                        .font(.headline)
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding()
                        .id(index)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
