//
//  SigninModel.swift
//  QVick
//
//  Created by dgsw8th16 on 4/20/24.
//

import Foundation

struct SigninModel {
    var email: String = ""
    var password: String = ""
    
    var params: [String: Any] {
        return [
            "email": email,
            "password": password
        ] as Dictionary
    }
        
}
