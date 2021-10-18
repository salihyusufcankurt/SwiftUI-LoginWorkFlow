//
//  LoginViewModel.swift
//  SwiftUILoginWorkFlow
//
//  Created by salihyusufcankurt on 15.10.2021.
//

import Foundation

class LoginViewModel: ObservableObject{
    @Published var credentials = Credentials()
    @Published var showProgressView = false
    
    var loginDisabled: Bool{
        credentials.email.isEmpty || credentials.password.isEmpty
    }
    
    func login(completion: @escaping (Bool) -> Void){
        showProgressView = true
        APIService.shared.login(credentials: credentials) { [unowned self] (result: Result<Bool, APIService.APIError>) in
            showProgressView = false
            switch result {
            case .success:
                completion(true)
            case .failure:
                credentials = Credentials()
                completion(false)
            }
        }
    }
}
