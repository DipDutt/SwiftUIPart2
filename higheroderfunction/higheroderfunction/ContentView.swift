//
//  ContentView.swift
//  higheroderfunction
//
//  Created by Dip Dutt on 13/2/23.
//

import SwiftUI


struct userModel:Identifiable {
    
    let id = UUID().uuidString
    let name:String?
    let points:Int
    let isverified:Bool
}


class higherOderFunction:ObservableObject {
    
    @Published var dataArray: [userModel] = []
    @Published var fuctionArrary: [userModel] = []
    @Published var mapArrary: [String] = []
    
    
    init() {
       getData()
    updateArray()
    }
    
    func updateArray() {
        
//        mapArrary = dataArray.map({ (user) -> String in
//            user.name
//        })
        
        
        //mapArrary = dataArray.compactMap({$0.name})
        
        
        
        //fuctionArrary = dataArray.filter({$0.name.contains("i")})
        
        //fuctionArrary = dataArray.sorted(by: {$0.points > $1.points})
        
        mapArrary = dataArray
            .sorted(by:{$0.points > $1.points})
            .filter({$0.isverified})
            .compactMap({$0.name})
        
    
        
        
    }
    
    
    func getData() {
        let user1 = userModel(name: nil, points: 30, isverified: true)
    let user2 = userModel(name: "jennifar", points: 15, isverified: false)
    let user3 = userModel(name: "Becky", points: 25, isverified: true)
    let user4 = userModel(name: "Leonard", points: 20, isverified: true)
    let user5 = userModel(name: "Molly", points: 18, isverified: false)
    let user6 = userModel(name: "Tanisa", points: 50, isverified: true)
    let user7 = userModel(name: nil, points: 10, isverified: false)
    let user8 = userModel(name: "Chris", points: 35, isverified: true)
    self.dataArray.append(contentsOf:
                        [user1,
                        user2,
                        user3,
                        user4,
                        user5,
                        user6,
                        user7,
                        user8])
    }
    
    
        
}
    
    
    
    
    


struct ContentView: View {
    @StateObject var vm = higherOderFunction()
    var body: some View {
        ScrollView {
            VStack(alignment:.leading ,spacing:10) {
                
                ForEach(vm.mapArrary, id: \.self) { points in
                    Text("\(points)")
            
                }
//                    VStack(alignment:.leading) {
//                        Text(item.name)
//                            .font(.headline)
//
//                        HStack {
//                            Text(" Point:\(item.points)")
//                            Spacer()
//                            if item.isverified {
//                                Image(systemName: "flame.fill")
//                                    .foregroundColor(.red)
//                            }
//                        }
//                    }
//
//                }
//                .foregroundColor(.white)
//                .padding(.horizontal, 20)
//                .padding(.vertical,10)
//                .background(.blue)
//                .cornerRadius(10)
                
            }
            
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
