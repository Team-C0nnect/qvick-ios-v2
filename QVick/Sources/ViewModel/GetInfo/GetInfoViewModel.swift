//
//  GetInfoViewModel.swift
//  QVick
//
//  Created by dgsw8th32 on 1/17/24.
//

import Foundation
import Alamofire

class GetInfoViewModel: ObservableObject {
    
    @Published var info = GetInfoModel(studentNumber: "", roomNumber: "")
    
    func postStdId() async {
        print("studentId")
        
        AF.request("\(Constant.url)/student",
                   method: .post,
                   parameters: ["stdId" : info.studentNumber] as Dictionary,
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
    
    func postRoomId() async {
        print("roomId")
        
        AF.request("\(Constant.url)/room",
                   method: .post,
                   parameters: ["roomId" : info.roomNumber] as Dictionary,
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
