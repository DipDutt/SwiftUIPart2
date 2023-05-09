//
//  ContentView.swift
//  customButtonStyle
//
//  Created by Dip Dutt on 27/3/23.
//

import SwiftUI

struct pressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct ContentView: View {
var body: some View {
        VStack {
            Button {
                
            } label: {
                Text("press here")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height:55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            .ButtonStyle()

        }
        .padding()
    }
}


extension View  {
    func ButtonStyle() -> some View {
       buttonStyle(pressableButtonStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
