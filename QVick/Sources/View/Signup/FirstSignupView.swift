//
//  FirstSignupView.swift
//  QVick
//
//  Created by dgsw8th36 on 4/19/24.
//

import SwiftUI

struct FirstSignupView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var vm: SignupViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
            
            HStack {
                Text("회원가입을 위해 정보를 입력해주세요.")
                    .font(.pretendard(.bold, 20))
                    .foregroundStyle(Color.white)
                
                Spacer()
            }
            .padding(.horizontal, 25)
            
            
            VStack(spacing: 40) {
                
                SigninTextField(title: "아이디(이메일)", icon: "person.fill", text: $vm.model.email, prompt: "이메일을 입력해주세요.")
                
                SigninTextField(title: "비밀번호", icon: "lock.fill", text: $vm.model.password, prompt: "비밀번호를 입력해주세요.", type: .secure)
                
                SigninTextField(title: "비밀번호 확인", icon: "lock.fill", text: $vm.model.passwordVerify, prompt: "비밀번호를 입력해주세요.", type: .secure)
                
            }
            
            Spacer()
            
            NavigationLink() {
                SecondSignupView()
                    .navigationBarBackButtonHidden()
                    .environmentObject(vm)
            } label: {
                SigninButton(title: "다음") {
                }
                .disabled(true)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blackGray)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
                .tint(Color.white)
            }
            
            
            ToolbarItem(placement: .principal) {
                    Text("회원가입")
                        .foregroundStyle(Color.white)
                        .font(.pretendard(.bold, 24))

            }
            
            
        }
        
    }
}

#Preview {
    NavigationView {
        FirstSignupView()
    }
}
