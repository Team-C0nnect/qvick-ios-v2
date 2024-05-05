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
  
    func checkAttendence() {
        AF.request("\(Constant.url)/attendence",
                   method: .get,
                   headers: ["Authorization": "Bearer \(KeyChain.read()?.accessToken ?? "")"]
        )
        .response { response in
            if let statuscode = response.response?.statusCode {
                if statuscode == StatusCode.success.rawValue {
                    self.isCheck = true
                }
                else {
                    if self.isCheck == true {
                        self.isCheck = false
                    }
                }
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
