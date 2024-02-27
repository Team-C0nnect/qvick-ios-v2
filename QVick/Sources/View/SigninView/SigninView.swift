//
//  SigninView.swift
//  QVick
//
//  Created by dgsw8th32 on 1/17/24.
//

import SwiftUI

struct SigninView: View {
    
    @ObservedObject var loginViewModel = SigninViewModel()
    
    
    var body: some View {
        NavigationView {
            
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
            .padding(.vertical, 15)
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blueGray)
            .navigationBarHidden(true)
            
        }
        
    }
}

#Preview {
    SigninView()
}
