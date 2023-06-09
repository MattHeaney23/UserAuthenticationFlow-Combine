//
//  UserAuthenticationFlowApp.swift
//  UserAuthenticationFlow
//
//  Created by Matt on 08/06/2023.
//

import SwiftUI

@main
struct UserAuthenticationFlowApp: App {
    
    @ObservedObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            if appState.userSignedIn {
                HomeView()
            } else {
                LoginView()
            }
        }
    }
}
