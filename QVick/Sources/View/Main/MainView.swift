//
//  MainView.swift
//  QVick
//
//  Created by dgsw8th36 on 1/18/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = MainViewModel()
    
    var body: some View {
            VStack(spacing: 50) {
                
                HStack {
                    
                    Image("QvickLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75)
                    
                    Spacer()
                    
                    NavigationLink {
                        SettingsView()
                            .environmentObject(vm)
                    } label: {
                        VStack(spacing: 5) {
                                
                            Rectangle()
                                .frame(width: 33, height: 4.5)
                                
                            Rectangle()
                                .frame(width: 33, height: 4.5)
                        
                            Rectangle()
                                .frame(width: 33, height: 4.5)
                        }
                        .foregroundStyle(.white)
                    }
                    
                }
                .padding(.horizontal, 30)
                
                VStack(spacing: 10) {
                    HStack {
                        Text("출석")
                            .font(.pretendard(.bold, 32))
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                        
                        VStack {
                            Text(vm.isCheck ? "출석완료" : "출석미완료")
                                .font(.pretendard(.bold, 25))
                                .foregroundStyle(vm.isCheck ? Color.baseGreen : Color.deepOrange)
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    QRCheckButton(view: {
                        AnyView(QRCameraView())
                    })
              
                }
                
                Spacer()
                
            }
            .padding(.vertical, 30)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blueGray)
            .navigationBarBackButtonHidden()
            .onAppear {
                vm.checkAttendence()
            }
            
            
        }
        
}

#Preview {
    MainView()
}
