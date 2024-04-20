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
                   headers: ["Authorization": "Bearer \(SigninViewModel.tokenData.accessToken ?? "")"]
        )
        .response { response in
            if let statuscode = response.response?.statusCode {
                if statuscode == StatusCode.success.rawValue {
                    self.isCheck = true
                }
                else {
                    if !self.isCheck == false {
                        self.isCheck = false
                    }
                }
            }
        }
    }
}
