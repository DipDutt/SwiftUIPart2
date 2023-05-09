//
//  ContentView.swift
//  keyPreference
//
//  Created by Dip Dutt on 2/4/23.
//


// 

import SwiftUI

struct ContentView: View {
    @State var Text:String = "hello, world"
    var body: some View {
        NavigationStack {
            VStack {
                SecondView(text:Text )
                    .navigationTitle("PreferenceKey")
                    .customTittle("New Title")
                   
            }
            .onPreferenceChange(CustomTittlePreference.self) { value  in
                self.Text = value
            }
            
        }
       
        }
    }


extension View {
    
    func customTittle(_ text:String) -> some View {
        preference(key: CustomTittlePreference.self, value: text )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct SecondView:View {
    let text:String
    var body: some View {
        Text(text)
    }
}


struct CustomTittlePreference: PreferenceKey {
    
   static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
    
}
