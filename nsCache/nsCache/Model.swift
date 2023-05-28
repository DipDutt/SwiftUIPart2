//
//  Model.swift
//  nsCache
//
//  Created by Dip Dutt on 17/5/23.
//

import Foundation

struct Photo:Codable,Identifiable {
    let id:Int
   let title:String
   let thumbnailUrl:String
    
}
