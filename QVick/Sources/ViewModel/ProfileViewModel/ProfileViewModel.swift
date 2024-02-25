//
//  ProfileViewModel.swift
//  QVick
//
//  Created by dgsw8th36 on 2/25/24.
//

import Foundation
import Alamofire

class ProfileViewModel: ObservableObject {
    
    @Published var userInfo: UserDataModel = UserDataModel(stdId: "", roomId: "")
    
    func getUserInfo() {
        
        self.getStdId()
        self.getRoomId()
        
    }
    
    func getStdId() {
        
        AF.request("\(Constant.url)/student",
                   method: .get,
                   encoding: JSONEncoding(),
                   headers: ["Authorization": "Bearer \(LoginViewModel.tokenData.accessToken ?? "")"]
        )
        .responseDecodable(of: GetStdIdResponse.self) { response in
            
            switch response.result {
            case .success(let data):
                
                self.userInfo.stdId = data.stdId
                
                return
            case .failure(let e):
                print(e)
            }
            
        }
        
    }
    
    func getRoomId() {
        
        AF.request("\(Constant.url)/room",
                   method: .get,
                   encoding: JSONEncoding(),
                   headers: ["Authorization": "Bearer \(LoginViewModel.tokenData.accessToken ?? "")"]
        )
        .responseDecodable(of: GetRoomIdResponse.self) { response in
            
            switch response.result {
            case .success(let data):
                
                self.userInfo.roomId = data.roomId
                
                return
            case .failure(let e):
                print(e)
            }
            
        }
        
    }
    
    
}
