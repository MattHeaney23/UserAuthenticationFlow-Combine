//
//  DelaySimulator.swift
//  UserAuthenticationFlow
//
//  Created by Matt on 08/06/2023.
//

import Foundation

class DelaySimulator {
    
    static func runAfterRandomDelay(_ functionality: @escaping () -> ()) {
        let randomDelay = 5.0//Double.random(in: 1...4)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + randomDelay) {
            functionality()
        }
    }
}
