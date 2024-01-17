//
//  LoginViewModel.swift
//  QVick
//
//  Created by dgsw8th16 on 1/17/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

class LoginViewModel: ObservableObject {
    init() {
        
    }
    
    func googleSignIn() {
        guard let viewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        
        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { signinResult, error in
                        
        }
    }
    
}
