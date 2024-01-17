//
//  PersonalDataCell.swift
//  QVick
//
//  Created by dgsw8th32 on 1/16/24.
//

import SwiftUI

struct PersonalDataCell: View {

    var label: String
    let action: () -> Void
    let navigate: () -> Void
    var isClicked: Bool
    
    init(label: String,  isClicked: Bool, action: @escaping () -> Void, navigate: @escaping () -> Void ) {
        self.label = label
        self.isClicked = isClicked
        self.action = action
        self.navigate = navigate
    }
    
    
    var body: some View {
        HStack {
            
            Button(action: {
                action()
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
                navigate()
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

