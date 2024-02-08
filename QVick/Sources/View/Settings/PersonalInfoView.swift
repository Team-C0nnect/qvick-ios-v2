//
//  PersonalInfoView.swift
//  QVick
//
//  Created by dgsw8th36 on 1/23/24.
//

import SwiftUI

struct PersonalInfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            
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
                    
                    Text("이용약관")
                        .font(.judson(.bold, 24))
                        .foregroundStyle(Color.white)
                        .padding(.trailing, 20)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            
            Rectangle()
                .frame(width: 360, height: 1)
                .foregroundStyle(Color.white)
            
            HStack {
                
                Image("QvickLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                
                Spacer()
                
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 10)
            
            Spacer()
            
        }
        .padding(.vertical, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blackGray)
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    PersonalInfoView()
}
