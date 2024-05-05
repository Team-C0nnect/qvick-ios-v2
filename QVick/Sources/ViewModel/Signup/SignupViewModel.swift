import SwiftUI
import Alamofire


class SignupViewModel: ObservableObject {
    @Published var model = SignupModel()
    @Published var alert: (Bool, String, () -> ()) = (false, "", {})
    @Published var rootActive: Bool = false
    
    func signup() {
        
        AF.request("\(Constant.url)/auth/sign-up",
                   method: .post,
                   parameters: model.params,
                   encoding: JSONEncoding()
        )
        .response { response in
            if let statuscode = response.response?.statusCode {
                
                if statuscode == StatusCode.created.rawValue {
                    self.alert = (true, "회원가입이 완료되었습니다.", {
                        self.rootActive = false
                    })
                    
                }
                else {
                    self.alert = (true, "이미 존재하는 회원입니다.", {
                        
                    })
                }
            }
        }
    }
    
}
