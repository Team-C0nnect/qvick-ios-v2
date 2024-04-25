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
                   headers: ["Authorization": "Bearer \(SigninViewModel.tokenData.accessToken ?? "")"]
        )
        .responseDecodable(of: ProfileModel.self) { response in
            switch response.result {
            case .success(let data):
                self.model = data
            case .failure(let e):
                print(e.localizedDescription)
            }
            
        }
        
    }
    
    func deleteUser() {
        AF.request("\(Constant.url)/user",
                   method: .delete,
                   headers: ["Authorization": "Bearer \(SigninViewModel.tokenData.accessToken ?? "")"]
        )
        .response() { response in
            if let statusCode = response.response?.statusCode {
                if statusCode == StatusCode.success.rawValue {
                    UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        exit(0)
                    }
                    
                }
            }
            
        }
    }
    
    
    
    
}
