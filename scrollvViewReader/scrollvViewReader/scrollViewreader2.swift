//
//  scrollViewreader2.swift
//  scrollvViewReader
//
//  Created by Dip Dutt on 7/3/23.
//

import SwiftUI

struct scrollViewreader2: View {
    @State var textFieldText:String = ""
    @State var scrollTo:Int = 0
    var body: some View {
        VStack {
            TextField("enter the number to scroll", text:$textFieldText )
                .foregroundColor(.orange)
                .padding()
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .border(.red)
                .padding()
                .keyboardType(.numberPad)
                .textFieldStyle(.automatic)
            Button("press the button") {
                withAnimation(.spring()) {
                    if let Number = Int(textFieldText){
                        scrollTo = Number
                    }
                }
            }
            ScrollView {
                ScrollViewReader { proxy in
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
                    .onChange(of:scrollTo) { newValue in
                        proxy.scrollTo(newValue, anchor: .center)
                    }
                }
            }
        }
        .background(
            Image("shiva")
        
        )
    }
    
}



struct scrollViewreader2_Previews: PreviewProvider {
    static var previews: some View {
        scrollViewreader2()
    }
}
