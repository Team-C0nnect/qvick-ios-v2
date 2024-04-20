//
//  SchoolSelectionCell.swift
//  QVick
//
//  Created by dgsw8th36 on 1/16/24.
//

import SwiftUI

struct SchoolSelectionCell: View {
    
    var schoolName: String
    var schoolAddress: String
    
    init(schoolName: String, schoolAddress: String) {
        self.schoolName = schoolName
        self.schoolAddress = schoolAddress
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .frame(height: 66)
            .foregroundStyle(.white)
            .overlay {
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text("\(schoolName)")
                            .font(.pretendard(.bold, 20))
                        
                        Text("\(schoolAddress)")
                            .font(.pretendard(.regular, 11))
                            .foregroundStyle(Color(red: 144 / 255, green: 144 / 255, blue: 144 / 255))
                        
                    }
                    .padding(.horizontal, 11)
                    .padding(.top, 3)
                    
                    Spacer()
                }
                
            }
            .padding(.horizontal, 20)
        
    }
}

#Preview {
    ZStack {
        Color(red: 58 / 255, green: 63 / 255, blue: 74 / 255).ignoresSafeArea()
        
        ScrollView {
            ForEach(0..<10, id: \.self) { _ in
                SchoolSelectionCell(schoolName: "대구소프트웨어마이스터고등학교", schoolAddress: "대구광역시 달성군 구지면 창리로11길 93")
                
                Spacer(minLength: 30)
            }
        }
    }
}
