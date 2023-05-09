//
//  ContentView.swift
//  toolbar
//
//  Created by Dip Dutt on 17/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       NavigationStack {

            
         VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
         .toolbar() {
             
             ToolbarItemGroup(placement: .primaryAction) {
                 Button {
                     print("cacel the view")
                 } label: {
                     Text("cancel")
                 }
                 
                 Button {
                         print("cacel the view")
                     } label: {
                         Text("save")
                     }
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
