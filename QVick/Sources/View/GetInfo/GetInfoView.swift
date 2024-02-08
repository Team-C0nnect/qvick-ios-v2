//
//  ProfileNumberView.swift
//  QVick
//
//  Created by dgsw8th36 on 1/18/24.
//

import SwiftUI

struct GetInfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var studentNumber: String = ""
    @State var roomNumber: String = ""
    
    @ObservedObject var getInfoViewModel = GetInfoViewModel()
    
    var body: some View {
        NavigationView {
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
                        
                        Text("프로필")
                            .font(.judson(.bold, 24))
                            .foregroundStyle(Color.white)
                            .padding(.trailing, 20)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(Color.white)
                    
                }
                
                VStack(spacing: 40) {
                    
                    HStack {
                        Image("QvickLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                        
                        Spacer()
                    }
                    
                    
                    VStack(spacing: 35) {
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("학번")
                                    .font(.judson(.bold, 24))
                                    .foregroundStyle(Color.white)
                                
                                Text("자신의 학번을 작성해주세요")
                                    .font(.judson(.bold, 15))
                                    .foregroundStyle(Color.white)
                            }
                            
                            Spacer()
                        }
                        
                        GetInfoTextField(number: $studentNumber, prompt: "예 1118")
                        
                    }
                    
                    VStack(spacing: 35) {
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("기숙사")
                                    .font(.judson(.bold, 24))
                                    .foregroundStyle(Color.white)
                                
                                Text("자신의 기숙사 동호수를 작성해주세요.")
                                    .font(.judson(.bold, 15))
                                    .foregroundStyle(Color.white)
                            }
                            
                            Spacer()
                        }
                        
                        GetInfoTextField(number: $roomNumber, prompt: "예 408호")
                        
                    }
                    
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 35)
                
                Spacer()
                
            }
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blackGray)
            .nextButton(destination: MainView()) {
                getInfoViewModel.postStdId()
            }
        }
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    GetInfoView()
}
