//
//  TestSignInViewModel.swift
//  QVick
//
//  Created by dgsw8th32 on 2/26/24.
//
    
import Alamofire
import SwiftUI

class TestSignInViewModel: ObservableObject {
    var email: String = "" {
        willSet(newValue) {
            
        }
    }
    var password: String = "" {
        willSet(newValue) {
            
        }
    }
    
    func testSignIn() {
        guard let viewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        
        let nextVC = UIHostingController(rootView: PersonalDataView())
        nextVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        AF.request("\(Constant.url)/auth/sign-up",
                   method: .post,
                   parameters: ["name":"신민호", "email":email, "password":password] as Dictionary,
                   encoding: JSONEncoding()
                   
        )
        .validate()
        .responseDecodable(of: SigninModel.self) { response in
            switch response.result {
            case .success(let data):
                SigninViewModel.tokenData = data
                print(SigninViewModel.tokenData.accessToken)
                if !((SigninViewModel.tokenData.accessToken) == nil) {
                    viewController.present(nextVC, animated: false)
                }
                return
            case .failure(_):
                break
            }
        }
        
    }
}
