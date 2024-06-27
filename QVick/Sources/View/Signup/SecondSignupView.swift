//
//  SecondSignupView.swift
//  QVick
//
//  Created by dgsw8th16 on 4/19/24.
//

import SwiftUI

struct SecondSignupView: View {
    
    @EnvironmentObject var vm: SignupViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
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
                
                SigninTextField(title: "자신의 이름을 작성해주세요.", icon: "person.fill", text: $vm.model.name, prompt: "ex): 박규민")
                
                SigninTextField(title: "자신의 학번을 작성해주세요.", icon: "person.fill", text: $vm.model.stdId, prompt: "ex): 2210")
                
                SigninTextField(title: "자신의 기숙사 호실을 작성해주세요.", icon: "bed.double.fill", text: $vm.model.room, prompt: "ex): 301")
            }
            
            Spacer()
            
            SigninButton(title: "회원가입") {
                vm.signup()
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
        .alert(isPresented: $vm.alert.0) {
            
            Alert(
                title: Text("큐빅"),
                message: Text(vm.alert.1),
                dismissButton: .cancel(Text("확인")) {
                    vm.alert.2()
                }
            )
        }
    }
}

#Preview {
    NavigationView {
        SecondSignupView()
            .environmentObject(SignupViewModel())
    }
}
