//
//  ProfileViewModel.swift
//  QVick
//
//  Created by dgsw8th36 on 2/25/24.
//

import Foundation
import Alamofire

public class ProfileViewModel: ObservableObject {
    
    @Published var model = ProfileModel()
    
    
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
    
    
}
