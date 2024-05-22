 //
//  SigninView.swift
//  QVick
//
//  Created by dgsw8th32 on 1/17/24.
//

import SwiftUI

struct SigninView: View {
    
    @StateObject var signinViewModel = SigninViewModel()
    @StateObject var signupViewModel = SignupViewModel()
    
    var body: some View {
        
        VStack {
            
            Image("QvickLogo")
            
            Text("큐빅에 오신걸 환영합니다.")
                .font(.pretendard(.bold, 14))
                .foregroundStyle(.white)
                .padding(.vertical)
            
            HStack {
                Text("당신의 정보를 입력 해주세요.")
                    .font(.pretendard(.bold, 15))
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 30)
            
            SigninTextField(title: "이메일", icon: "person.fill", text: $signinViewModel.model.email, prompt: "이메일을 입력 해주세요")
                .padding(.vertical)
            SigninTextField(title: "비밀번호", icon: "lock.fill", text: $signinViewModel.model.password, prompt: "비밀번호를 입력 해주세요", type: .secure)
            
            SigninButton(title: "로그인") {
                signinViewModel.signin()
                
            }
            .padding(.top, 50)
            
            HStack {
                Spacer()
                
                Text("계정이 없으신가요?")
                    .font(.pretendard(.regular, 15))
                    .foregroundStyle(.white)
                
                NavigationLink(isActive: $signupViewModel.rootActive) {
                    FirstSignupView()
                        .navigationBarBackButtonHidden()
                        .environmentObject(signupViewModel)
                } label: {
                    Text("회원가입")
                        .font(.pretendard(.regular, 15))
                        .foregroundStyle(Color.baseGreen)
                    
                }
                
            }
            .padding(.horizontal, 30)
            .padding(.top, 5)
            
            Spacer()
            

            
        }
        .padding(.vertical, 15)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blackGray)
        
    }
    
}

#Preview {
    NavigationView {
        SigninView()
    }
}
