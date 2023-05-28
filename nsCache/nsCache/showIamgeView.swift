//
//  showIamgeView.swift
//  nsCache
//
//  Created by Dip Dutt on 28/5/23.
//

import SwiftUI

struct showIamgeView: View {
    let url:URL?
    @StateObject var vm = ImageLoader()
    var body: some View {
        VStack {
            if let uiimage = vm.images {
                Image(uiImage: uiimage)
            }
            else {
                ProgressView("Loading")
            }
        }
        .task {
            await downloadImage()
        }
    }
    
    func downloadImage() async {
        do {
            try await vm.fetchImage(url)
        } catch  {
            print(error)
        }
    }
}
    
