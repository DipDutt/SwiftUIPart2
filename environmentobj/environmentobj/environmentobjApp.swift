//
//  environmentobjApp.swift
//  environmentobj
//
//  Created by Dip Dutt on 12/2/23.
//

import SwiftUI

@main
struct environmentobjApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(statechange())
                .environmentObject(statechange().count1)
                .environmentObject(statechange().count2)
        }
    }
}
