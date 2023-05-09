//
//  ContentView.swift
//  multithearding
//
//  Created by Dip Dutt on 11/2/23.
//

import SwiftUI


class backgroundThreadViewModel:ObservableObject {
    
    @Published var dataArray: [String ] = []
    
    
    func fetchData() {
        // put download data in back ground thread
        DispatchQueue.global().async {
            let newdata =  self.getData()
            // put update data in the  main thread for uiupdate
            DispatchQueue.main.async {
                self.dataArray = newdata
                
            }
        }
        
     
        
    }
    
    
    func getData()->[String] {
        
        var Data:[String] = []
        
        
        for x in 0..<100 {
            Data.append("\(x)")
            print(Data)
        }
        
        return Data
        
    }
    
    

    
}

struct ContentView: View {
    @StateObject var vm = backgroundThreadViewModel()
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(spacing:10) {
                
                Button("press the button") {
                    vm.fetchData()
                }
                
                ForEach(vm.dataArray, id: \.self) { item in
                    
                    Text(item)
                        .foregroundColor(.primary)
                        .font(.headline)
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
