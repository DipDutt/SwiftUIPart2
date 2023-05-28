//
//  ContentView.swift
//  nsCache
//
//  Created by Dip Dutt on 17/5/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        NavigationView{
            List(vm.Photo) { photo in
                HStack {
                    showIamgeView(url: URL(string: photo.thumbnailUrl))
                Text(photo.title)
                }
            }
            .task {
                 await vm.getPhotos()
            }
            .navigationTitle("Photos")
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
