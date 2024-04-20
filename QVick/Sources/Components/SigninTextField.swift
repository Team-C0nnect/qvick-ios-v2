//
//  SignInTextField.swift
//  QVick
//
//  Created by dgsw8th32 on 2/26/24.
//

import SwiftUI

enum FieldType {
    case just
    case secure
}

struct SigninTextField: View {
    
    let title: String
    let icon: String
    @Binding var text: String
    let prompt: String
    let type: FieldType
    
    init(title: String, icon: String, text: Binding<String>, prompt: String, type:FieldType = .just) {
        self.title = title
        self.icon = icon
        self._text = text
        self.prompt = prompt
        self.type = type
    }
    
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .foregroundStyle(.white)
                .font(.pretendard(.bold, 16))
            
            
            HStack(spacing: 13) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundStyle(Color.white)
                
                Group {
                    if type == .just {
                        TextField("Singin", text: $text, prompt: Text("\(prompt)").foregroundColor(.white))
                    }
                    else if type == .secure {
                        SecureField("Singin", text: $text, prompt: Text("\(prompt)"))
                    }
                    
                }
                    .font(.pretendard(.bold, 11))
                    .foregroundStyle(Color.white)
                
            }
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.white)
            
        }
        .padding(.horizontal, 28)
    }
}

#Preview {
    ZStack {
        Color.blueGray
        
        SigninTextField(title: "이메일", icon: "person.fill", text: .constant(""), prompt: "이메일을 입력해주세요.")
    }
}
