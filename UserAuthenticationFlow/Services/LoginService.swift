//
//  LoginService.swift
//  UserAuthenticationFlow
//
//  Created by Matt on 08/06/2023.
//

import Combine
import Foundation

///Local networker to simulate a login request. This takes a smaller delay, and checks the username and password against the fake user details stored locally
class LoginService {
    
    func attemptLogin(username: String, password: String) -> AnyPublisher<Bool, Never> {
    
        DelaySimulator
            .randomDelay()
            .flatMap { _ in
                Future { promise in
                    let userDetailsValid = MockedService().checkLoginDetails(username: username,
                                                                             password: password)
                    promise(.success(userDetailsValid))
                }
            }
            .eraseToAnyPublisher()
    }
}
