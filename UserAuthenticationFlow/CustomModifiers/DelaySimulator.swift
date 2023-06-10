//
//  DelaySimulator.swift
//  UserAuthenticationFlow
//
//  Created by Matt on 08/06/2023.
//

import Combine
import Foundation

class DelaySimulator {
    
    ///A random delay generator, simulating a network request
    static func randomDelay() -> Future<Bool, Never> {
        return Future { completion in
            let randomDelay = Double.random(in: 1...4)
            DispatchQueue.main.asyncAfter(deadline: .now() + randomDelay) {
                completion(.success(true))
            }
        }
    }
}
