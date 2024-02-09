//
//  GetInfoViewModel.swift
//  QVick
//
//  Created by dgsw8th32 on 1/17/24.
//

import Foundation
import Alamofire

class GetInfoViewModel: ObservableObject {
    
    @Published var info = GetInfoModel(schoolNumber: "1116")
    
    
    var content: String {
        let content = info.schoolNumber
        return content
    }
    
    func postStdId() {
        AF.request("\(Constant.url)/student",
                   method: .post,
                   parameters: ["stdId" : info.schoolNumber] as Dictionary,
                   encoding: JSONEncoding(),
                   headers: ["Authorization": "Bearer \(LoginViewModel.tokenData.accessToken ?? "")"]
        )
        .validate()
        .response { response in
            
            switch response.result {
                
            case .success(let result):
                print(result)
                break
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
    
}
