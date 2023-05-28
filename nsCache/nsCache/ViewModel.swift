//
//  ViewModel.swift
//  nsCache
//
//  Created by Dip Dutt on 17/5/23.
//

import Foundation


class ViewModel:ObservableObject {
    @Published var Photo:[Photo] = []
    
    func getPhotos() async {
        do {
          let Photos = try await webService().fetchPhotos()
            self.Photo = Photos
        } catch  {
            print(error)
        }
        
    }
}



