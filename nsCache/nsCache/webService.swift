//
//  webService.swift
//  nsCache
//
//  Created by Dip Dutt on 17/5/23.
//

import Foundation


class webService {
    
    func fetchPhotos() async throws -> [Photo] {
        let (data, _) = try await URLSession.shared.data(from: URL(string: "https://jsonplaceholder.typicode.com/photos")!)
        return try JSONDecoder().decode([Photo].self, from: data)
    }
    
}
