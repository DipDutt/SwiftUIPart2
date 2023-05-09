//
//  ContentView.swift
//  numerictextField
//
//  Created by Dip Dutt on 15/2/23.
//

import SwiftUI


enum FocusedField {
    case int
    case dec
}

struct ContentView: View {
    
    @State private var IntTextField = ""
    @State private var DecTextField = ""
    @FocusState private var focusTextField: FocusedField?
    
    var body: some View {
        
        NavigationStack {
            VStack {
                TextField("enter the int value", text: $IntTextField)
                    .focused($focusTextField, equals: .int)
                    .keyboardType(.numberPad)
                TextField("enter the dec value", text: $DecTextField)
                    .focused($focusTextField, equals: .dec)
                    .keyboardType(.decimalPad)
                Spacer()
            }
            .navigationTitle("NumebersOnly")
            .textFieldStyle(.roundedBorder)
            .frame(width: 200)
            .toolbar {
                ToolbarItem(placement:.keyboard) {
                    Spacer()
                }
                ToolbarItem(placement:.keyboard) {
                    
                    Button {
                        focusTextField = nil
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.left" )
                        
                        
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
