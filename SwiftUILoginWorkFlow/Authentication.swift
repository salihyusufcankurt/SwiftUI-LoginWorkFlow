//
//  Authentication.swift
//  SwiftUILoginWorkFlow
//
//  Created by salihyusufcankurt on 15.10.2021.
//

import SwiftUI

class Authentication: ObservableObject {
    @Published var isValidated = false
    
    enum AuthenticationError: Error, LocalizedError, Identifiable{
        case invalidCredentials
        
        var id: String {
            self.localizedDescription
        }
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return NSLocalizedString("Either your mail or password are incorrect", comment: "")
            
            }
        }
    }
    
    func updateValidation(success: Bool) {
        withAnimation{
            isValidated = success
        }
    }
    
}
