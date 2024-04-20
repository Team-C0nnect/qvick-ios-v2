//
//  SigninButton.swift
//  QVick
//
//  Created by dgsw8th32 on 4/18/24.
//

import SwiftUI

struct SigninButton: View {
    let title: String
    let action: () -> ()
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    
    var body: some View {
        Button(action: {
            action()
           
        }, label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 340, height: 55)
                .foregroundStyle(Color.baseGreen)
                .overlay {
                    Text("\(title)")
                        .font(.pretendard(.bold, 20))
                        .foregroundStyle(.white)
                }
        })
    }
}

#Preview {
    SigninButton(title: "", action: {})
        
}
