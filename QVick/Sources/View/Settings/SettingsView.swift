//
//  SettingsView.swift
//  QVick
//
//  Created by dgsw8th32 on 1/22/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var profileVM = ProfileViewModel()
    @EnvironmentObject var mainVM: MainViewModel
    
    var body: some View {
        VStack {
            HStack {
                Image("QvickLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75)
                
                Spacer()
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.white)
                })
            }
            .padding(.horizontal, 35)
            
            NavigationLink {
                ProfileView()
                    .environmentObject(profileVM)
                    .environmentObject(mainVM)
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 345, height: 105)
                    .foregroundStyle(.clear)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20).stroke(.white, lineWidth: 1.5)
                        
                        HStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .foregroundStyle(.black)
                            
                            Spacer()
                            
                            Text("\(profileVM.model.stdId) \(profileVM.model.name)")
                                .font(.pretendard(.bold, 30))
                                .foregroundStyle(.white)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 15)
                    }
                    .padding(.vertical, 30)
            }
            
            VStack(spacing: 30) {
                HStack {
                    NavigationLink {
                        PersonalInfoView()
                    } label: {
                        VStack(spacing: 2) {
                            Text("개인정보 약관")
                                .font(.pretendard(.bold, 20))
                                .foregroundStyle(.white)
                            
                            Rectangle()
                                .frame(width: 110, height: 1)
                                .foregroundStyle(.white)
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 40)
            }
            
            Spacer()
            
        }
        .padding(.vertical, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blueGray)
        .navigationBarBackButtonHidden()
        .onAppear {
            profileVM.getUserInfo()
        }
    }
}

#Preview {
    SettingsView()
}
