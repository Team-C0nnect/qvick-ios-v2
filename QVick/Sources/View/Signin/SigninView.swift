//
//  SigninView.swift
//  QVick
//
//  Created by dgsw8th32 on 1/17/24.
//

import SwiftUI

struct SigninView: View {
    
    @ObservedObject var signinViewModel = SigninViewModel()
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                Image("QvickLogo")
                
                Text("큐빅에 오신걸 환영합니다.")
                    .font(.judson(.bold, 14))
                    .foregroundStyle(.white)
                    .padding(.vertical)
                
                HStack {
                    Text("당신의 정보를 입력 해주세요.")
                        .font(.judson(.bold, 15))
                        .foregroundStyle(.white)
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 30)
                
                SigninTextField(title: "이메일", icon: "person.fill", text: $signinViewModel.email, prompt: "이메일을 입력 해주세요")
                    .padding(.vertical)
                SigninTextField(title: "비밀번호", icon: "lock.fill", text: $signinViewModel.password, prompt: "비밀번호를 입력 해주세요")
                
                SigninButton()
                    .padding(.top, 50)
                    .environmentObject(signinViewModel)
                
                HStack {
                    Spacer()
                    
                    Text("계정이 없으신가요?")
                        .font(.judson(.regular, 15))
                        .foregroundStyle(.white)
                    
                    Button(action: {
                        print("회원가입 화면 이동")
                    }, label: {
                        Text("회원가입")
                            .font(.judson(.regular, 15))
                            .foregroundStyle(Color.baseGreen)
                            
                    })
                }
                .padding(.horizontal, 30)
                .padding(.top, 5)
                
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
