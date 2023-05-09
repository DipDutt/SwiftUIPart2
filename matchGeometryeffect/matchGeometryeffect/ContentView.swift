//
//  ContentView.swift
//  matchGeometryeffect
//
//  Created by Dip Dutt on 28/3/23.
//

import SwiftUI

struct ContentView: View {
    @State var isshow:Bool = false
    @Namespace var namespace
    
    var body: some View {
        VStack {
            if !isshow {
                RoundedRectangle(cornerRadius: 10)
                    .matchedGeometryEffect(id: 1, in:namespace )
                    .frame(width: 100, height: 100)
                
            }
            Spacer()
            
            Spacer()
            
            if isshow {
                RoundedRectangle(cornerRadius: 10)
                    .matchedGeometryEffect(id: 1, in:namespace )
                    .frame(width: 200, height: 250)
            }
        }
        .frame(maxWidth: .infinity)
        .background(.green)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isshow.toggle()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedgeometryEffect()
    }
}



struct MatchedgeometryEffect:View {
    
    let categories:[String] = ["Home", "Popular", "Saved"]
    @State private var selected: String = ""
    @Namespace var namespace
    
    
    var body: some View {
        
        HStack(alignment: .bottom) {
            
            ForEach(categories,id: \.self) { categorie in
                
                ZStack {
                        if selected == categorie {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.mint.opacity(0.5))
                                .matchedGeometryEffect(id: "categories_list", in:namespace )
                            
                        }
                        Text(categorie)
                        
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .padding()
                .onTapGesture {
                    withAnimation(.spring()) {
                        selected = categorie
                    }
                }
            }
        
        }
    }
}
