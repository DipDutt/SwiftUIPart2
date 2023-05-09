//
//  ContentView.swift
//  hashvalue
//
//  Created by Dip Dutt on 7/2/23.
//

import SwiftUI

struct employee:Hashable{
    let name:String
}


struct ContentView: View {
    
    @State var data:[employee] = [employee(name: "dip"),
    employee(name: "joy"),
    employee(name: "diptha")
                                  
    ]
    var body: some View {
        ScrollView {
            VStack {
                
                ForEach(data, id:\.self) { dataitem in
                    Text(dataitem.name)
                    
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
