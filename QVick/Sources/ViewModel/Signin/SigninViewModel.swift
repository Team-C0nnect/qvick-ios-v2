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
    
    
    func signin() {
        guard let viewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        
        let nextVC = UIHostingController(rootView: NavigationView { MainView() })
        nextVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        if (self.model.email != "") && (self.model.password != "") {
            AF.request("\(Constant.url)/auth/sign-in",
                       method: .post,
                       parameters: self.model.params,
                       encoding: JSONEncoding()
                       
            )
            .validate()
            .responseDecodable(of: StatusModel<TokenModel>.self) { response in
                
                switch response.result {
                case .success(let result):
                    
                    if let data = result.data {
                        if KeyChain.create(token: data) {
                            viewController.present(nextVC, animated: true)
                        }
                        else {
                            
                        }
                    }
                   
                    
                case .failure(_):
                    break
                }
            }
        }
        
    }
    
}
