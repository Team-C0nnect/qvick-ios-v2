//
//  SigninButton.swift
//  QVick
//
//  Created by dgsw8th32 on 4/18/24.
//

import SwiftUI

struct SigninButton: View {
    @EnvironmentObject var viewModel: SigninViewModel
    
    var body: some View {
        Button(action: {
            viewModel.SignIn()
            print("이메일 : \(viewModel.email)")
            print("비밀번호 : \(viewModel.password)")
        }, label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 340, height: 55)
                .foregroundStyle(Color.baseGreen)
                .overlay {
                    Text("로그인")
                        .font(.judson(.bold, 20))
                        .foregroundStyle(.white)
                }
        })
    }
}

#Preview {
    SigninButton()
        .environmentObject(SigninViewModel())
}
