//
//  QRCheckButton.swift
//  QVick
//
//  Created by dgsw8th32 on 1/18/24.
//

import SwiftUI
import LocalAuthentication


struct QRCheckButton: View {
    
    @State var isPresented: Bool = false
    
    let view: () -> AnyView
    
    let context = LAContext()
    
    var body: some View {
        
        Button {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "인증이 필요합니다.") { (result, error) in
                DispatchQueue.main.async {
                    isPresented = result
                }
                
            }
            
        } label: {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 336, height: 97)
                .foregroundStyle(.white)
                .overlay {
                    HStack {
                        Circle()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(Color.skyBlue)
                            .overlay {
                                Image(systemName: "qrcode.viewfinder")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                            }
                            .padding(.leading)
                        
                        Spacer()
                        
                        Text("출석하기")
                            .font(.pretendard(.bold, 20))
                        
                        Image(systemName: "chevron.right")
                            .font(.pretendard(.bold, 20))
                            .padding(.trailing)
                    }
                }
        }
        .tint(.black)
        .sheet(isPresented: $isPresented) {
            if #available(iOS 16, *) {
                view()
                    .presentationDetents([.height(680)])
            } else {
                view()
            }
        }
        
    }
}



#Preview {
    ZStack {
        Color.blueGray
        
        QRCheckButton {
            AnyView(EmptyView())
        }
    }
    .ignoresSafeArea()
}
