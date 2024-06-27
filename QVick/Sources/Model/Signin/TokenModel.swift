//
//  LoginModel.swift
//  QVick
//
//  Created by dgsw8th16 on 2/6/24.
//

import Foundation

struct TokenModel: Codable {
    var accessToken: String?
    var refreshToken: String?
    var userRole: String?
}


