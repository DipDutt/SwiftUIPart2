//
//  ContentView.swift
//  dpendencyInjection
//
//  Created by Dip Dutt on 9/4/23.
//

import SwiftUI
import Combine

struct PostModel:Identifiable,Codable {
    let userId:Int
    let id:Int
    let title:String
    let body:String
}

class dataServiceProduction {
    
    var url:URL
    
    init(url:URL) {
        self.url = url
    }
    
    func fetchData()-> AnyPublisher<[PostModel],Error> {
        URLSession.shared.dataTaskPublisher(for:url)
            .receive(on: DispatchQueue.main)
            .map({$0.data})
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

class dependencyInjectViewModel: ObservableObject {
    
    @Published var dataArray:[PostModel] = []
    var cancallebles = Set<AnyCancellable>()
    let dataService: dataServiceProduction
    
    init(dataService:dataServiceProduction){
        self.dataService = dataService
        getData()
    }
    
    func getData() {
        dataService.fetchData()
            .sink { _ in
                
            } receiveValue: { [weak self] returnValue in
                self?.dataArray = returnValue
            }
        
            .store(in: &cancallebles)
    }
}

struct ContentView: View {
    @StateObject var vm:dependencyInjectViewModel
    
    init(dataService:dataServiceProduction) {
        _vm = StateObject(wrappedValue: dependencyInjectViewModel(dataService:dataService))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray) { post in
                    Text(post.title)
                    Text(post.body)
                        .font(.largeTitle)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let dataService = dataServiceProduction(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
    static var previews: some View {
        ContentView(dataService: dataService)
    }
}
