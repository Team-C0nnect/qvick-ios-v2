//
//  ApplicationButton.swift
//  QVick
//
//  Created by dgsw8th32 on 1/23/24.
//

import SwiftUI

struct ApplicationButton: View {
    @State var action = ""
    
    var body: some View {
        Button(action: {
            print(action)
        }, label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 330, height: 50)
                .foregroundStyle(Color(red: 65 / 255, green: 201 / 255, blue: 130 / 255))
                .overlay {
                    Text("신청")
                        .font(.judson(.bold, 20))
                        .foregroundStyle(.white)
                }
        })
        .padding(.vertical, 40)
    }
}

#Preview {
    ApplicationButton()
}
