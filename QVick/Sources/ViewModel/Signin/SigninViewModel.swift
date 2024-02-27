//
//  LoginViewModel.swift
//  QVick
//
//  Created by dgsw8th16 on 1/17/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import Alamofire

class SigninViewModel: ObservableObject {
    
    init() {
    }
    
    static var tokenData = SigninModel()
    
   
    
    func googleSignIn() {
        guard let viewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        
        let nextVC = UIHostingController(rootView: PersonalDataView())
        nextVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        
        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { signinResult, error in
            if error == nil {
                if let idToken = signinResult?.user.idToken?.tokenString {
                    AF.request("\(Constant.url)/auth",
                               method: .post,
                               parameters: ["idToken":idToken] as Dictionary,
                               encoding: JSONEncoding()
                               
                    )
                    .validate()
                    .responseDecodable(of: SigninModel.self) { response in
                        switch response.result {
                        case .success(let data):
                            SigninViewModel.tokenData = data
                            print(SigninViewModel.tokenData.accessToken)
                            viewController.present(nextVC, animated: false)
                            return
                        case .failure(_):
                            break
                        }
                    }
                }
            }
            
        }
        
        
    }
}


