//
//  TestSigninView.swift
//  QVick
//
//  Created by dgsw8th32 on 2/26/24.
//

import SwiftUI

struct TestSigninView: View {
    @ObservedObject var signinViewModel = SigninViewModel()
    @StateObject var testSignInViewModel = TestSignInViewModel()
    @State var isMaintain: Bool = false
    
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
                    testSignInViewModel.testSignIn()
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
                
                SigninButton(imageName: "GoogleIcon") {
                    signinViewModel.googleSignIn()
                }
                .scaleEffect(x: 0.5, y: 0.5)
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
    TestSigninView()
}
