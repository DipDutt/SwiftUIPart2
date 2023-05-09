//
//  ContentView.swift
//  JsonApi with escaping
//
//  Created by Dip Dutt on 25/2/23.
//

import SwiftUI

struct Welcome: Identifiable,Codable {
    let id: Int
    let title, body: String
}


class jsonViewModel: ObservableObject {
    
    @Published var posts:[Welcome] = []
    
    init() {
        getPost()
    }
    
    func getPost() {
        
        guard let Url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        downLoadData(fromURL: Url) {  returndata in
            
            if let data = returndata {
                guard let newdata = try? JSONDecoder().decode([Welcome].self, from: data) else {return}
                DispatchQueue.main.async { [weak self] in
                    self?.posts = newdata
                }
            }
            else {
                print(" no data found")
            }
        }
    }
    
    func downLoadData(fromURL url:URL, complitionHandaler: @escaping(_ data:Data?)-> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                  error == nil,
                  let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                print("error to download data")
                complitionHandaler(nil)
                return
            }
            complitionHandaler(data)
        }.resume()
    }
}

struct ContentView: View {
    @StateObject var vm = jsonViewModel()
    var body: some View {
        VStack {
            List {
                ForEach(vm.posts) { post in
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
            }
           
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
