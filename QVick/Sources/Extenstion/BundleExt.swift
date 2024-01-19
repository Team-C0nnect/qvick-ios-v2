//
//  BundleExt.swift
//  QVick
//
//  Created by dgsw8th16 on 1/19/24.
//

import Foundation

extension Bundle {
    var url: String {
        guard let file = self.path(forResource: "ApiContent", ofType: "plist") else {
            return ""
        }
        guard let resource = NSDictionary(contentsOf: URL(filePath: file)) else {
            return ""
        }
        
        let url = "\(resource["URL"]!):\(resource["PORT"]!)"
        
        return url
    }
}
