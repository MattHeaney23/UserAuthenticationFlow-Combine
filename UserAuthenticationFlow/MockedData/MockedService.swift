//
//  MockedService.swift
//  UserAuthenticationFlow
//
//  Created by Matt on 08/06/2023.
//

import Foundation

class MockedService {
    
    let mockedUsers: [User] = [
        .init(username: "Matt", password: "password1"),
        .init(username: "Gina", password: "password2"),
        .init(username: "Ryan", password: "password3"),
        .init(username: "Baxter", password: "password4")
    ]
    
    func checkLoginDetails(username: String, password: String) -> Bool {
        let user = User(username: username, password: password)
        return mockedUsers.contains(where: { $0 == user })
    }
}
