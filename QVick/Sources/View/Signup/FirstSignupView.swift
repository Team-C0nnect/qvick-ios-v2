//
//  FirstSignupView.swift
//  QVick
//
//  Created by dgsw8th36 on 4/19/24.
//

import SwiftUI

struct FirstSignupView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var signupViewModel = SignupViewModel()
    
    var body: some View {
        VStack {
            
            VStack(spacing: 20) {
                
                HStack(spacing: 0) {
                    
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.judson(.regular, 20))
                            .foregroundStyle(Color.white)
                    }
                    
                    Spacer()
                    
                    Text("회원가입")
                        .font(.judson(.bold, 24))
                        .foregroundStyle(Color.white)
                        .padding(.trailing, 20)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                Rectangle()
                    .frame(width: 360, height: 1)
                    .foregroundStyle(Color.white)
            }
            .padding(.vertical, 30)
            
            Text("회원가입을 위해 정보를 입력해주세요.")
                .font(.pretendard(.bold, 20))
                .foregroundStyle(.white)
                .padding(.trailing, 58)
                .padding(.bottom, 45)
            
            VStack(spacing: 40) {
                
                SigninTextField(title: "아이디(이메일)", icon: "person.fill", text: $signupViewModel.info.email, prompt: "이메일을 입력해주세요.")
                
                SigninTextField(title: "비밀번호", icon: "lock.fill", text: $signupViewModel.info.password, prompt: "비밀번호를 입력해주세요.", type: .secure)
                
                SigninTextField(title: "비밀번호 확인", icon: "lock.fill", text: $signupViewModel.info.passwordCheck, prompt: "비밀번호를 입력해주세요.", type: .secure)
                
            }
            
            Spacer()
            
            NavigationLink {
                // 정보 입력 뷰
            } label: {
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 54)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color.baseGreen)
                    .overlay {
                        Text("다음")
                            .font(.pretendard(Pretendard.bold, 20))
                            .foregroundStyle(Color.white)
                    }
                    .padding(.horizontal, 27)
                
            }
            .padding(.bottom, 10)
//            .disabled(disable)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blackGray)
        
    }
}

#Preview {
    FirstSignupView()
}
