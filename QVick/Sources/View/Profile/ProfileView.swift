//
//  ProfileView.swift
//  QVick
//
//  Created by dgsw8th36 on 1/22/24.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var profileVM: ProfileViewModel
    @EnvironmentObject var mainVM: MainViewModel
    
    
    var body: some View {
        VStack(spacing: 20) {
            
            HStack {
                
                Button {
                    
                    self.presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    
                    Image(systemName: "chevron.left")
                        .font(.pretendard(.regular, 20))
                        .foregroundStyle(Color.white)
                    
                }
                
                Spacer()
                
            }
            .padding(.horizontal, 30)
            
            HStack {
                
                Text("프로필")
                    .font(.pretendard(.bold, 32))
                    .foregroundStyle(.white)
                
                Spacer()
                
                
                
            }
            .padding(.horizontal, 30)
            
            Circle()
                .frame(width: 180, height: 180)
            
            VStack(spacing: 30) {
                
                ProfileCell(title: "이름", name: profileVM.model.name)
                
                ProfileCell(title: "학번", name: profileVM.model.stdId)
                
                ProfileCell(title: "호수", name: profileVM.model.room ?? "없음")
                
                ProfileCell(title: "출석여부", name: mainVM.isCheck ? "출석" : "X", attendance: mainVM.isCheck)
                
            }
            .padding(.vertical, 10)
            
            Spacer()
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blackGray)
        .navigationBarBackButtonHidden()
        
        
    }
}

#Preview {
    ProfileView()
        .environmentObject(ProfileViewModel())
        .environmentObject(MainViewModel())
}
