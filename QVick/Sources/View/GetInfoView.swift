//
//  ProfileNumberView.swift
//  QVick
//
//  Created by dgsw8th36 on 1/18/24.
//

import SwiftUI

struct GetInfoView: View {
    
    @State var name: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            VStack(spacing: 20) {
                
                HStack(spacing: 0) {
                    Image(systemName: "chevron.left")
                        .font(.judson(.regular, 20))
                        .foregroundStyle(Color.white)
                    
                    Spacer()
                    
                    Text("이용약관")
                        .font(.judson(.bold, 24))
                        .foregroundStyle(Color.white)
                        .padding(.trailing, 20)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                Rectangle()
                    .frame(width: 360, height: 1)
                    .foregroundStyle(Color.white)
                
            }
            
            HStack {
                Image("QvickLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                
                Spacer()
            }
            .padding(.horizontal, 30)
            
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("학번")
                        .font(.judson(.bold, 24))
                        .foregroundStyle(Color.white)
                    
                    Text("자신의 학번을 써주세요")
                        .font(.judson(.bold, 15))
                        .foregroundStyle(Color.white)
                }
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 60)
            
            
            
            VStack {
                
                TextField("",
                          text: $name,
                          prompt: Text("예1118").foregroundStyle(Color.white)
                )
                .font(.judson(.bold, 20))
                .foregroundStyle(Color.white)
                
                Rectangle()
                    .frame(width: 360, height: 1)
                    .foregroundStyle(Color.white)
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blackGray)
        .nextButton(destination: ContentView())
        
    }
}

#Preview {
    GetInfoView()
}
