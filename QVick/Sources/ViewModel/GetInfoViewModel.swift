//
//  GetInfoViewModel.swift
//  QVick
//
//  Created by dgsw8th32 on 1/17/24.
//

import Foundation

class GetInfoViewModel: ObservableObject {
    
    @Published var info = GetInfoModel(schoolNumber: "1116")
    
    var content: String {
        var content = info.schoolNumber
        return content
    }
    
}
