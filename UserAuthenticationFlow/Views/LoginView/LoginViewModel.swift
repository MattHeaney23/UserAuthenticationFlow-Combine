//
//  LoginViewModel.swift
//  UserAuthenticationFlow
//
//  Created by Matt on 08/06/2023.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var loginState: LoginState = .ready
    
    @Published var loginDetailsValid: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private let appState: AppState
    
    init(appState: AppState) {
        self.appState = appState
        prepareLoginValidation()
    }
    
    private func prepareLoginValidation() {
        $userName
            .combineLatest($password)
            .map { $0.count >= 3 && $1.count >= 3 }
            .assign(to: \.loginDetailsValid, on: self)
            .store(in: &cancellables)
    }
    
    public func attemptLogin() {
        self.loginState = .loading
        
        LoginService().attemptLogin(username: userName, password: password)
            .sink { [weak self] successfulLogin in
                if successfulLogin == false {
                    self?.loginState = .error
                } else {
                    self?.appState.logUserIn()
                }
            }
            .store(in: &cancellables)
    }
}

