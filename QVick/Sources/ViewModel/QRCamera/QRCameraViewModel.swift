

import Foundation
import Alamofire

class QRCameraViewModel: ObservableObject {
    @Published var value: String = ""
    
    var isCompleted = {
        
    }
    
    func attendance(value: String) {
        let header: HTTPHeaders = ["Authorization": "Bearer \(KeyChain.read()?.accessToken ?? "")"]
        
        
        AF.request(
            "\(Constant.url)/attendance",
            method: .post,
            parameters: ["code": value] as Dictionary,
            encoding: JSONEncoding(),
            headers: header
        )
        .validate()
        .response { response in
            if let statuscode = response.response?.statusCode {
                if statuscode == StatusCode.success.rawValue {
                    self.isCompleted()
                }
                
            }
        }
    }
}
