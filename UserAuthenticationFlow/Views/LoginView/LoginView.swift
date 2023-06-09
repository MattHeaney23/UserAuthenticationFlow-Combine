//
//  LoginView.swift
//  UserAuthenticationFlow
//
//  Created by Matt on 08/06/2023.
//

import SwiftUI

struct LoginView: View {

    //MARK: State
    
    @FocusState private var focusedField: LoginViewFocusedField?
    @ObservedObject var viewModel = LoginViewModel()
    
    //MARK: Body
    
    var body: some View {
        
        VStack(spacing: 16) {
            welcomeHeader()
            textFields()
            loginButton()
        }
        .onSubmit { self.onSubmit() }
        .padding(.horizontal, 16)
        .padding(.bottom, 32)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(.yellow.opacity(0.5))
    }
    
    //MARK: Views
    
    private func welcomeHeader() -> some View {
        VStack {
            Text("Hello again, you!")
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
         
            if viewModel.loginState == .error {
                Text("There was an error. Please try again")
                    .font(.subheadline)
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    private func textFields() -> some View {
        VStack(spacing: 8) {
            TextField("Username", text: $viewModel.userName)
                .focused($focusedField, equals: .username)
            
            SecureField("Password", text: $viewModel.password)
                .focused($focusedField, equals: .password)
        }
        .textFieldStyle(.roundedBorder)
        .disabled(viewModel.loginState == .loading)

    }
    
    @ViewBuilder
    private func loginButton() -> some View {
        if viewModel.loginState == .loading {
            ProgressView()
        } else {
            Button {
                viewModel.attemptLogin()
            } label: {
                Text("Login")
            }
            .disabled(!viewModel.loginDetailsValid)
        }
    }
    
    //MARK: User Interactivity
    
    func onSubmit() {
        if focusedField == .username {
            focusedField = .password
        } else {
            focusedField = nil
            if viewModel.loginDetailsValid {
                viewModel.attemptLogin()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
