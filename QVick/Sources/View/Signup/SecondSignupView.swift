//
//  SecondSignupView.swift
//  QVick
//
//  Created by dgsw8th16 on 4/19/24.
//

import SwiftUI

struct SecondSignupView: View {
    var body: some View {
        VStack(spacing: 50) {
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.white)
                .padding(.horizontal, 20)
                .offset(y: -30)
            
            HStack {
                Text("회원가입을 위해 정보를 입력해주세요.")
                    .font(.pretendard(.bold, 20))
                    .foregroundStyle(Color.white)
                
                Spacer()
            }
            .padding(.horizontal, 25)
            
            VStack(spacing: 30) {
                SigninTextField(title: "자신의 이름을 작성해주세요.", icon: "person.fill", text: .constant(""), prompt: "ex): 박규민")
                
                SigninTextField(title: "자신의 학번을 작성해주세요.", icon: "person.fill", text: .constant(""), prompt: "ex): 2210")
                
                SigninTextField(title: "자신의 기숙사 호실을 작성해주세요.", icon: "bed.double.fill", text: .constant(""), prompt: "ex): 301호")
            }
            
            Spacer()
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blueGray)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    
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
        SecondSignupView()
    }
}
