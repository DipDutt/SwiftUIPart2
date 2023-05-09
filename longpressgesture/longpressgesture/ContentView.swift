//
//  ContentView.swift
//  longpressgesture
//
//  Created by Dip Dutt on 14/2/23.
//

import SwiftUI

struct ContentView: View {
    @State var isCompleted:Bool = false
    @State var issucces:Bool = false
    var body: some View {
        VStack {
            
            Rectangle()
                .fill( isCompleted ? Color.green : Color.blue)
                .frame(maxWidth: issucces ? .infinity : 0)
                .frame(maxHeight: 55)
                .frame(maxWidth: .infinity,alignment: .leading)
                .background(Color.gray)
            
            Text("press the button")
                .foregroundColor(Color.white)
                .padding()
                .background(Color.black)
                .cornerRadius(10.0)
                .onLongPressGesture(minimumDuration: 1.0) {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        isCompleted = true
                    }
                    
                } onPressingChanged: { (pressing) in
                    if pressing {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            issucces = true
                        }
                    }
                    else {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                            if !isCompleted {
                                withAnimation(.easeInOut(duration: 2.0)) {
                                    issucces = false
                                }
                            }
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
