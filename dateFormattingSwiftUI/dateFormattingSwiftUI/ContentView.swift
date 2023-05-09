//
//  ContentView.swift
//  dateFormattingSwiftUI
//
//  Created by Dip Dutt on 12/3/23.
//

import SwiftUI

struct ContentView: View {
    var currentDate = Date()
    var body: some View {
        
            Text("\(currentDate.formatted())")
            //Text(currentDate.formatted(date: .omitted, time:.complete))
            //Text(currentDate.formatted(date:.omitted , time: .shortened))
            //Text(currentDate.formatted(date: .long, time: .omitted))
            //Text(currentDate, format: Date.FormatStyle().dayOfYear())
            //Text(currentDate, format: Date.FormatStyle().day().month(.twoDigits).year(.defaultDigits).timeZone(.genericLocation))
            
            
            
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
