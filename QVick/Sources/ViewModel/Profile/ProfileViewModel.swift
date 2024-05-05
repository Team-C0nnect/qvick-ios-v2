//
//  ProfileViewModel.swift
//  QVick
//
//  Created by dgsw8th36 on 2/25/24.
//

import Foundation
import Alamofire
import UIKit

public class ProfileViewModel: ObservableObject {
    
    @Published var model = ProfileModel()
    @Published var isAlert = false
    
    func getUserInfo() {
        
        AF.request("\(Constant.url)/user",
                   method: .get,
                   headers: ["Authorization": "Bearer \(KeyChain.read()?.accessToken ?? "")"]
        )
        .responseDecodable(of: ProfileModel.self) { response in
            
            switch response.result {
            case .success(let data):
                
                self.model = data
            case .failure(_):
                 break
            }
            
        }
        
    }
    
    func deleteUser() {
        AF.request("\(Constant.url)/user",
                   method: .delete,
                   headers: ["Authorization": "Bearer \(KeyChain.read()?.accessToken ?? "")"]
        )
        .response() { response in
            if let statusCode = response.response?.statusCode {
                if statusCode == StatusCode.success.rawValue {
                    qvickExit()
                    
                }
            }
            
        }
    }
    
    
    
    
}
