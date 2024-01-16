//
//  PersonalDataCell.swift
//  QVick
//
//  Created by dgsw8th32 on 1/16/24.
//

import SwiftUI

struct PersonalDataCell: View {

    var label: String
    @State var isClicked: Bool = false
    
    init(label: String) {
        self.label = label
    }
    
    var body: some View {
        HStack {
            
            Button(action: {
                isClicked.toggle()
            }, label: {
                Circle()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(.clear)
                    .overlay {
                        ZStack {
                            Circle().stroke(.white, lineWidth: 1)
                            
                            Image(systemName: "checkmark")
                                .foregroundStyle(isClicked ? .white : .clear)
                                .fontWeight(.semibold)
                        }
                    }
            })
            .padding(.leading)
            .padding(.trailing)
            
            Text(label)
                .font(.judson(Judson.bold, 15))
                .foregroundStyle(.white)
            
            Spacer()
            
            Button(action: {
                print("이용약관 클릭!")
            }, label: {
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 10, height: 20)
                    .foregroundStyle(.white)
            })
            .padding(.trailing)
        }
    }
}

#Preview {
    ZStack {
        Color(red: 52/255, green: 58/255, blue: 71/255)
        PersonalDataCell(label: "서비스 이용약관(필수)")
            .padding(.bottom, 100)
        
        PersonalDataCell(label: "개인정보 수집/이용 동의(필수)")
        
        PersonalDataCell(label: "개인정보 제3자 정보제공 동의(필수)")
            .padding(.top, 100)
        
        PersonalDataCell(label: "신민호랑 데이트(선택)")
            .padding(.top, 200)

    }
    .ignoresSafeArea()
}
