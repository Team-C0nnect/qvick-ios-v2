

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
        .responseDecodable(of: StatusModel<Empty>.self) { response in
            switch response.result {
            case .success(let result):
                if result.status == StatusCode.success.rawValue {
                    self.isAlert = true
                }
            case .failure(_):
                break
            }
                
        }
    }
}
