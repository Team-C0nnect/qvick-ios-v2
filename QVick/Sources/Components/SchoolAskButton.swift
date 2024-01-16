//
//  SchoolAskButton.swift
//  QVick
//
//  Created by dgsw8th36 on 1/16/24.
//

import SwiftUI

struct SchoolAskButton: View {
    
    var body: some View {
        
        HStack {
            
            Text("학교가 없어요")
                .font(.judson(Judson.bold, 11))
                .foregroundStyle(Color(red: 144 / 255, green: 144 / 255, blue: 144 / 255))
            
            Button {
                
                print("웹 뷰 보여주기")
                
            } label: {
                
                Text("문의하기")
                    .font(.judson(Judson.bold, 11))
                    .foregroundStyle(Color(red: 65 / 255, green: 201 / 255, blue: 130 / 255))
                
            }

        }
    }
}

#Preview {
    ZStack {
        
        Color(red: 58 / 255, green: 63 / 255, blue: 74 / 255).ignoresSafeArea()
        
        VStack {
            
            Image("QvickLogo")
            
            Spacer()
            
            SchoolAskButton()
            
        }
    }
}
