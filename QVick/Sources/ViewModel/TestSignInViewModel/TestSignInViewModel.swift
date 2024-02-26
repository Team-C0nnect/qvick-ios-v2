//
//  TestSignInViewModel.swift
//  QVick
//
//  Created by dgsw8th32 on 2/26/24.
//

import Foundation
import Alamofire

class TestSignInViewModel: ObservableObject {
    var email: String = "" {
        willSet(newValue) {
            
        }
    }
    var password: String = "" {
        willSet(newValue) {
            
        }
    }
    
    func signIn() async {
        print("signIn")
        
        AF.request("\(Constant.url)/auth/sign-in",
                   method: .post,
                   parameters: ["email" : self.email, "password" : self.password] as Dictionary,
                   encoding: JSONEncoding()
        )
        .validate()
        .response { response in
            
            switch response.result {
                
            case .success(let result):
                print(result)
                break
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
}
