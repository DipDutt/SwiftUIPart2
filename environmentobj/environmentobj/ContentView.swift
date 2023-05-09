//
//  ContentView.swift
//  environmentobj
//
//  Created by Dip Dutt on 12/2/23.
//

import SwiftUI


class statechange:ObservableObject {
    var count1 = countbyOne()
    var count2 = countbyTwo()
    
}

class countbyOne:ObservableObject {
    @Published var count:Int = 0
}

class countbyTwo:ObservableObject {
    @Published var count:Int = 0
}


struct ContentView: View {
    @EnvironmentObject var vm: countbyOne
    var body: some View {
        let _ = Self._printChanges()
        VStack {
            Text("\(vm.count)")
            Button("press for increment 1") {
                vm.count += 1
               
            }
            Subview()
        }
        
    }
}

struct Subview:View {
    @EnvironmentObject var vm: countbyTwo
    var body: some View {
        let _ = Self._printChanges()
        Text("\(vm.count)")
        Button("press for increment for 2") {
            vm.count += 2
        }
    }

}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(statechange())
    }
}
