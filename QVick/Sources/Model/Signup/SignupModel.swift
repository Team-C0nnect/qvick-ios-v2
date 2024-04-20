//
//  SignupModel.swift
//  QVick
//
//  Created by dgsw8th16 on 4/20/24.
//

import Foundation

struct SignupModel {
    var name: String = ""
    var email: String = ""
    var password: String = ""
    var passwordVerify: String = ""
    var stdId: String = ""
    var room: String = ""
    
    var params: [String: Any] {
        return [
            "name": name,
            "email": email,
            "password": password,
            "stdId": stdId,
            "room": room
        ] as Dictionary
    }
}
