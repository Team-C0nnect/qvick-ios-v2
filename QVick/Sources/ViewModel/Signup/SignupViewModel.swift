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
        .responseDecodable(of: StatusModel<Empty>.self) { response in
            switch response.result {
            case .success(let result):
                
                if result.status == StatusCode.created.rawValue {
                    self.alert = (true, "회원가입이 완료되었습니다.", {
                        self.rootActive.toggle()
                    })
                }
                else {
                    self.alert = (true, "이미 존재하는 회원입니다.", {
                        
                    })
                }
            case .failure(_):
                break
            }
        }
    }
    
}
