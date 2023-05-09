//
//  ContentView.swift
//  multiplesheets
//
//  Created by Dip Dutt on 15/2/23.
//

import SwiftUI

struct Details:Identifiable {
    
    let id = UUID().uuidString
    let name:String
    
}

enum Sheets:Identifiable {
case add
case product(Details)
    
    var id: String {
        switch self {
        case .add:
            return "adding on the sheet"
            
        case .product(let product):
            return product.id
        }
    
        
    }
}




struct ContentView: View {
    @State private var showsheet:Sheets?
    
    var body: some View {
        VStack {
            
            Button("add show") {
                showsheet = .add
            }
            
            Button("add Details") {
                showsheet = .product(Details(name: "Dip"))
            }
            
        }
        .sheet(item: $showsheet) { (sheets) in
            switch sheets {
                
            case .add:
                Text("show adding value")
                
            case .product(let product):
                Text("\(product.name)")
            
            }
                
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
