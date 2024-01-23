//
//  MainView.swift
//  QVick
//
//  Created by dgsw8th36 on 1/18/24.
//

import SwiftUI

struct MainView: View {
    
    let dummyDate: String = "01월 16일 21시 10분"
    
    var body: some View {
        VStack(spacing: 50) {
            
            HStack {
                
                Image("QvickLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75)
                
                Spacer()
                
                HamburgerButton(view: {
                    AnyView(EmptyView())
                })
                
            }
            .padding(.horizontal, 30)
            
            VStack(spacing: 10) {
                HStack {
                    Text("출석")
                        .font(.judson(.bold, 32))
                        .foregroundStyle(Color.white)
                    
                    Spacer()
                    
                    VStack {
                        Text("출석완료")
                            .font(.judson(.bold, 25))
                            .foregroundStyle(Color.baseGreen)
                        
                        Text("\(dummyDate)")
                            .font(.judson(.regular, 12))
                            .foregroundStyle(Color.white)
                    }
                }
                .padding(.horizontal, 30)
                
                QRCheckButton(view: {
                    AnyView(QRCameraView())
                })
            }
            
            VStack(spacing: 10) {
                HStack {
                    Text("외출 신청")
                        .font(.judson(.bold, 32))
                        .foregroundStyle(Color.white)
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                
                LeaveOutList {
                    LeaveOutModel(id: 0, date: Date.now, reason: "ws", accept: false)
                    LeaveOutModel(id: 0, date: Date.now, reason: "ws", accept: false)
                    LeaveOutModel(id: 0, date: Date.now, reason: "ws", accept: true)
                }
            }
            
            Spacer()
            
        }
        .padding(.vertical, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blackGray)
        
    }
}

#Preview {
    MainView()
}
