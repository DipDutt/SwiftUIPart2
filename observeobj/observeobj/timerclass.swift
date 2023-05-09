//
//  timerclass.swift
//  observeobj
//
//  Created by Dip Dutt on 4/2/23.
//

import Foundation
import SwiftUI
import Combine


class showTimer: ObservableObject {
    
    @Published var seconds: Int = 0
    
    init() {
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { showtimer in
            self.seconds += 1
        }
        
        }
    
    }

