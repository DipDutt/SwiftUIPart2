//
//  dpendencyInjectionApp.swift
//  dpendencyInjection
//
//  Created by Dip Dutt on 9/4/23.
//

import SwiftUI

@main
struct dpendencyInjectionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(dataService:dataServiceProduction(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!))
        }
    }
}
