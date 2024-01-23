//
//  ProfileCell.swift
//  QVick
//
//  Created by dgsw8th36 on 1/22/24.
//

import SwiftUI

struct ProfileCell: View {
    
    var title: String
    var name: String
    var attendance: Bool?
    
    var body: some View {
        VStack {
            
            HStack {
                
                Text("\(title)")
                    .foregroundStyle(.white)
                    .font(.judson(.regular, 13))
                    .padding(.bottom, 10)
                
                Spacer()
                
                if let a = attendance {
                    Text("\(name)")
                        .font(.judson(.bold, 20))
                        .foregroundStyle(attendance! ? Color.baseGreen : Color.deepOrange)
                } else {
                    Text("\(name)")
                        .font(.judson(.bold, 20))
                        .foregroundStyle(.white)
                }

                
            }
            .padding(.horizontal, 10)
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.white)
        }
        .padding(.horizontal, 50)
    }
}

#Preview {
    ZStack {
        
        Color.blackGray
        
        VStack(spacing: 30) {
            ProfileCell(title: "이름", name: "윤세욱")
            ProfileCell(title: "학번", name: "1118")
            ProfileCell(title: "호수", name: "408")
            ProfileCell(title: "출석여부", name: "출석", attendance: true)
        }
    }
    .background(Color.blackGray)
}
