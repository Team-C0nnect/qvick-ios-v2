//
//  TestSignInView.swift
//  QVick
//
//  Created by dgsw8th32 on 2/26/24.
//

import SwiftUI

struct TestSignInView: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    @StateObject var testSignInViewModel = TestSignInViewModel()
    @State var isMaintain: Bool
    
    var body: some View {
        ZStack {
            
            VStack {
                Image("QvickLogo")
                    .resizable()
                    .frame(width: 86, height: 46)
                    .padding(.top)
                
                Text("로그인 방식을 선택해주세요!")
                    .foregroundStyle(.white)
                    .font(.judson(.regular, 14))
                    .padding(.vertical, 5)
                    .padding(.bottom, 70)
                
                TestSignInTextField(name: "이메일", text: $testSignInViewModel.email, prompt: "예) minhogogo@gmail.com")
                TestSignInTextField(name: "비밀번호", text: $testSignInViewModel.password, prompt: "")
                    .padding(.vertical, 10)
                
                HStack {
                    Button(action: {
                        isMaintain.toggle()
                    }, label: {
                        Rectangle()
                            .frame(width: 15, height: 15)
                            .foregroundStyle(.white)
                            .overlay {
                                Image(systemName: "checkmark")
                                    .font(.judson(.bold, 15))
                                    .foregroundStyle(isMaintain ? .black : .clear)
                            }
                    })
                    
                    Text("로그인 상태 유지")
                        .font(.judson(.bold, 14))
                        .foregroundStyle(.white)
                    
                    Spacer()
                }
                .padding(.horizontal, 45)
                
                Button(action: {
                    
                }, label: {
                    Rectangle()
                        .frame(width: 310, height: 55)
                        .foregroundStyle(Color.baseGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                            Text("로그인")
                                .font(.judson(.bold, 20))
                                .foregroundStyle(.white)
                        }
                })
                
                HStack {
                    Button(action: {
                        print("이메일 찾기")
                    }, label: {
                        Text("이메일 찾기")
                            .foregroundStyle(.white)
                            .font(.judson(.bold, 10))
                    })
                    
                    Text("|")
                        .foregroundStyle(.white)
                        .padding(.bottom, 3)
                    
                    Button(action: {
                        print("비밀번호 찾기")
                    }, label: {
                        Text("비밀번호 찾기")
                            .foregroundStyle(.white)
                            .font(.judson(.bold, 10))
                    })
                }
                .padding(.vertical, 8)
                
                Text("- Or sign in with -")
                    .foregroundStyle(.white)
                    .font(.judson(.bold, 15))
                
                LoginButton(imageName: "GoogleIcon") {
                    loginViewModel.googleSignIn()
                }
                .padding(.vertical, 5)
                
                Spacer()
                
                SchoolAskButton()
                    .padding(.vertical, 15)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blueGray)
    }
}

#Preview {
    TestSignInView(isMaintain: false)
}
