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
    func attemptLogin(username: String, password: String) -> Future<Bool, Never> {
        Future { completion in
            DelaySimulator.runAfterRandomDelay {
                let user = User(username: username, password: password)
                
                if MockedData().mockedUsers.contains(where: { $0 == user }) {
                    completion(.success(true))
                } else {
                    completion(.success(false))
                }
            }
        }
    }
}
