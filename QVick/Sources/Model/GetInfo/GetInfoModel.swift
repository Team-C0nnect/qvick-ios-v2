//
//  GetInfoModel.swift
//  QVick
//
//  Created by dgsw8th32 on 1/17/24.
//

import Foundation

struct GetInfoModel {
    
    var studentNumber: String
    
    var roomNumber: String
    
}

struct ErrorModel: Decodable {
    
    var message: String? = nil
    
}
