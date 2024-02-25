//
//  ProfileView.swift
//  QVick
//
//  Created by dgsw8th36 on 1/22/24.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var vm = ProfileViewModel()
    
    @State var fixState: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                HStack {
                    
                    Button {
                        
                        self.presentationMode.wrappedValue.dismiss()
                        
                    } label: {
                        
                        Image(systemName: "chevron.left")
                            .font(.judson(.regular, 20))
                            .foregroundStyle(Color.white)
                        
                    }
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 30)
                
                HStack {
                    
                    Text("프로필")
                        .font(.judson(.bold, 32))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Button {
                        // 수정하는 뷰?
                        fixState.toggle()
                    } label: {
                        Text(fixState ? "완료" : "수정하기")
                            .font(.judson(.bold, 20))
                            .foregroundStyle(.white)
                    }
                    
                }
                .padding(.horizontal, 30)
                
                Circle()
                    .frame(width: 180, height: 180)
                
                VStack(spacing: 30) {
                    
                    ProfileCell(title: "이름", name: "윤세욱")
                    
                    ProfileCell(title: "학번", name: "\(vm.userInfo.stdId)")
                    
                    ProfileCell(title: "호수", name: "\(vm.userInfo.roomId)")
                    
                    ProfileCell(title: "출석여부", name: "출석", attendance: true)
                    
                }
                .padding(.vertical, 10)
                
                Spacer()
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blackGray)
            .navigationBarHidden(true)
            
        }
        .onAppear {
            vm.getUserInfo()
        }
        .navigationBarBackButtonHidden()
        
        
    }
}

#Preview {
    ProfileView()
}
