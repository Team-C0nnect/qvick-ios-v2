//
//  TestSignInTextField.swift
//  QVick
//
//  Created by dgsw8th32 on 2/26/24.
//

import SwiftUI

struct TestSignInTextField: View {
    
    let name: String
    @Binding var text: String
    let prompt: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            Text(name)
                .foregroundStyle(.white)
                .font(.judson(.bold, 15))
            
            RoundedRectangle(cornerRadius: 2)
                .frame(width: 310, height: 50)
                .foregroundStyle(Color(red: 52/255, green: 58/255, blue: 71/255))
                .shadow(color: .black.opacity(0.25), radius: 4, y: 4)
                .overlay {
                    TextField("", text: $text, prompt: Text("\(prompt)").foregroundColor(Color.white))
                        .font(.judson(.bold, 11))
                        .foregroundStyle(.white)
                        .tint(.white)
                        .padding(.horizontal, 10)
                }
        }
    }
}

#Preview {
    ZStack {
        Color.blueGray
        
        TestSignInTextField(name: "이메일", text: .constant(""), prompt: "누구의 젖탱이를 만지고 싶으신가요?")
    }
}
