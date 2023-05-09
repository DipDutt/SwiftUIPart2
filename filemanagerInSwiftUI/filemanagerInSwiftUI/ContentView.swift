//
//  ContentView.swift
//  filemanagerInSwiftUI
//
//  Created by Dip Dutt on 3/5/23.
//

import SwiftUI

struct ContentView: View {
    @State var vm = filemanagerViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                    
                    
                }
                
                HStack {
                    Button {
                        vm.saveImage()
                    } label: {
                        Text("Save to FM")
                            .foregroundColor(Color.orange)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    
                    Button {
                        vm.deleteImageFromFileManager()
                    } label: {
                        Text("Delete from FM")
                            .foregroundColor(Color.orange)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    
                    Text(vm.infomessage)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.mint)
                }
                Spacer()
                
            }
            .padding()
            .navigationTitle("FileManager")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
