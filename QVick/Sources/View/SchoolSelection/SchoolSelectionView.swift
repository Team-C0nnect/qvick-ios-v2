//
//  SchoolSelectionView.swift
//  QVick
//
//  Created by dgsw8th16 on 1/16/24.
//

import SwiftUI

struct SchoolSelectionView: View {
    @StateObject var schoolSelcetion = SchoolSelectionViewModel()
    
    var body: some View {
        VStack(spacing: 45) {
            VStack(spacing: 12) {
                Image("QvickLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 45)
                
                Text("학교를 선택해주세요!")
                    .font(.judson(Judson.regular, 14))
                    .foregroundStyle(Color.white)
            }
            
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 355, height: 50)
                .foregroundStyle(Color.white)
                .overlay {
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        TextField("재학중인 학교 입력해주세요", text: $schoolSelcetion.content)
                            .font(.judson(Judson.regular, 13))
                        
                    }
                    .padding(.horizontal, 20)
                }
            
            ScrollView {
                SchoolSelectionCell(schoolName: "대구소프트웨어마이스터고등학교", schoolAddress: "대구광역시 달성군 구지면 창리로11길 93")
            }
            
            SchoolAskButton()
            
        }
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blackGray)
        
    }
}

#Preview {
    SchoolSelectionView()
}
