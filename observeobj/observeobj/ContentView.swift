//
//  ContentView.swift
//  observeobj
//
//  Created by Dip Dutt on 4/2/23.
//

import SwiftUI

// observedobject help to update the view if any changes happen in the ViewModel section.

struct ContentView: View {
    @ObservedObject var ShowTimer = showTimer()
    var body: some View {
        VStack {
            Text("\(ShowTimer.seconds)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
