//
//  LoginView.swift
//  QVick
//
//  Created by dgsw8th32 on 1/17/24.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginViewModel = LoginViewModel()
    
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Image("QvickLogo")
                
                Text("로그인 방식을 선택해 주세요")
                    .font(.judson(.regular, 14))
                    .foregroundStyle(.white)
                
                Spacer()
                
                LoginButton(imageName: "GoogleIcon") {
                    loginViewModel.googleSignIn()
                }
                
                
                
                Spacer()
                
                SchoolAskButton()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blueGray)
            
        }
    }
}

#Preview {
    LoginView()
}
