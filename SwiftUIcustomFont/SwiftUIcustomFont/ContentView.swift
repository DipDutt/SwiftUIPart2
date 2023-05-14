//
//  ContentView.swift
//  SwiftUIcustomFont
//
//  Created by Dip Dutt on 14/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
            Text("Hello, world!")
            .font(.custom( "Baskerville", size: 40.0 ))
    }
    
//    init() {
//        for familyName in UIFont.familyNames {
//            print(familyName)
//
//            for fontName in UIFont.fontNames(forFamilyName: familyName) {
//                print(" -- \(fontName)")
//            }
//        }
//
//
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
