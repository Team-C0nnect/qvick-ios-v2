//
//  LoginViewModel.swift
//  QVick
//
//  Created by dgsw8th16 on 1/17/24.
//

import SwiftUI
import Alamofire

class SigninViewModel: ObservableObject {
    @Published var model = SigninModel()
    
    static var tokenData = TokenModel()
    
    func signin() {
        guard let viewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        
        let nextVC = UIHostingController(rootView: MainView())
        nextVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        if (self.model.email != "") && (self.model.password != "") {
            AF.request("\(Constant.url)/auth/sign-in",
                       method: .post,
                       parameters: self.model.params,
                       encoding: JSONEncoding()
                       
            )
            .validate()
            .responseDecodable(of: TokenModel.self) { response in
                switch response.result {
                case .success(let data):
                    SigninViewModel.tokenData = data
                    
                    print(SigninViewModel.tokenData.accessToken ?? "")
                    
                    if !((SigninViewModel.tokenData.accessToken) == nil) {
                        viewController.present(nextVC, animated: true)
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
    }
   
}
