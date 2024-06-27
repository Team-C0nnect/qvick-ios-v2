//
//  MainViewModel.swift
//  QVick
//
//  Created by dgsw8th16 on 4/20/24.
//

import Foundation
import Alamofire

class MainViewModel: ObservableObject {
    @Published var isCheck: Bool = false
    @Published var isAlert: Bool = false
  
    func checkAttendence() {
        AF.request("\(Constant.url)/user/status",
                   method: .get,
                   headers: ["Authorization": "Bearer \(KeyChain.read()?.accessToken ?? "")"]
        )
        .responseDecodable(of: StatusModel<Empty>.self) { response in
            
            switch response.result {
            case .success(let result):
                if result.status == StatusCode.success.rawValue {
                    self.isCheck = true
                }
                else {
                    self.isCheck = false
                }
            case .failure(_):
                break
            }
            
        }
    }
    
    func refresh() {
        AF.request("\(Constant.url)/auth/refresh",
                   method: .post,
                   parameters: ["refreshToken": "Bearer \(KeyChain.read()?.accessToken ?? "")"] as Dictionary,
                   encoding: JSONEncoding()
        )
        .responseDecodable(of: TokenModel.self) { response in
            switch response.result {
            case .success(let data):
                if !KeyChain.update(token: data) {
                    
                }
            case .failure(_):
                break
            }
        }
    }
}
