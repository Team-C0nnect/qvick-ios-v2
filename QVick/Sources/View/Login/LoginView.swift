//
//  LoginView.swift
//  QVick
//
//  Created by dgsw8th32 on 1/17/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        
        VStack {
            
            Image("QvickLogo")
            
            Text("로그인 방식을 선택해 주세요")
                .font(.judson(.regular, 14))
                .foregroundStyle(.white)
            
            Spacer()
            
            NavigationLink {
                PersonalDataView()
            } label: {
                LoginButton(imageName: "DodamIcon", action: {print("신민호 고추")})
                    .disabled(true)
            }
            
            Spacer()
            
            SchoolAskButton()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blueGray)
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    LoginView()
}
