//
//  ContentView.swift
//  Viewbuilder
//
//  Created by Dip Dutt on 27/3/23.
//

import SwiftUI

struct buttonViewModiFier:ViewModifier {
    
    func body(content: Content) -> some View {
        content
        .font(.headline)
        .foregroundColor(.white)
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(Color.mint)
        .cornerRadius(10)
        .shadow(color: .black, radius: 6)
        }
    }



struct ContentView: View {
    var body: some View {
        VStack(spacing:20) {
            Spacer()
            
            Text("Hello, world!")
                .buttonFormatting()

            
            Text("Hello,dip!")
                .buttonFormatting()
            
            Text("Hello, joy!")
                .buttonFormatting()

           
        }
        .padding()
    }
}

extension View {
    
    func buttonFormatting() -> some View  {
        modifier(buttonViewModiFier())
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
