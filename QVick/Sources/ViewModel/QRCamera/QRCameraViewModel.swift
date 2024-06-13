

import Foundation
import Alamofire

class QRCameraViewModel: ObservableObject {
    @Published var value: String = ""
    @Published var isAlert: Bool = false
    
    
    func attendance(value: String) {
        let header: HTTPHeaders = ["Authorization": "Bearer \(KeyChain.read()?.accessToken ?? "")"]
        
        
        AF.request(
            "\(Constant.url)/user/attendance",
            method: .post,
            parameters: ["code": value] as Dictionary,
            encoding: JSONEncoding(),
            headers: header
        )
        .validate()
        .response { response in
            if let statuscode = response.response?.statusCode {
                if statuscode == StatusCode.success.rawValue {
                    self.isAlert = true
                }
                
            }
        }
    }
}
