//
//  LoginView.swift
//  SwiftUILoginWorkFlow
//
//  Created by salihyusufcankurt on 15.10.2021.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    var body: some View {
        VStack{
            Text("Secure App")
                .font(.title)
            TextField("Email Address", text: $loginVM.credentials.email)
                .keyboardType(.emailAddress)
                .padding(.top, 60)
            SecureField("Password", text: $loginVM.credentials.password)
            
            if loginVM.showProgressView {
                ProgressView()
            }
            
            Button("Log in"){
                loginVM.login { success in
                    authentication.updateValidation(success: success)
                }
            }
            .disabled(loginVM.loginDisabled)
            .padding(.all, 20)
            Spacer()
            
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .autocapitalization(.none)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        .disabled(loginVM.showProgressView)
        .alert(item: $loginVM.error) { error in
            Alert(title: Text("Invalid Login"), message: Text(error.localizedDescription))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
