//
//  StatusModel.swift
//  QVick
//
//  Created by minho shin on 6/24/24.
//

import Foundation

struct StatusModel<Model: Decodable>: Decodable {
    let status: Int
    let message: String
    let data: Model?
    
    
    init(status: Int, message: String, data: Model? = nil) {
        self.status = status
        self.message = message
        self.data = data
    }
}
