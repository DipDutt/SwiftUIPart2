//
//  ContentView.swift
//  geometryReader
//
//  Created by Dip Dutt on 1/3/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            ZStack {
                
                GeometryReader { proxy in
                    VStack {
                        Image("cat")
                            .resizable()
                            .frame(width:proxy.size.width, height:proxy.size.height/2)
                        
                        ZStack {
                            Text("Text")
                           }
                        .frame(width:proxy.size.width , height: proxy.size.height/3)
                        .background(Color.pink)
                        
                        ZStack {
                            Text("more Text")
                        }
                        .frame(width:proxy.size.width , height: proxy.size.height/5)
                        .background(Color.yellow)
                     
                }
                
              }
            } .frame(minWidth: 0,maxWidth: .infinity ,minHeight: 0, maxHeight: .infinity)
                .background(Color.cyan)
            
                
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
