//
//  GetInfoTextField.swift
//  QVick
//
//  Created by dgsw8th36 on 1/23/24.
//

import SwiftUI

struct GetInfoTextField: View {
    
    @Binding var number: String
    let prompt: String
    
    var body: some View {
        
        VStack {
            TextField("",
                      text: $number,
                      prompt: Text("\(prompt)").foregroundStyle(Color.white)
            )
            .font(.judson(.bold, 20))
            .foregroundStyle(Color.white)
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.white)
        }
    }
    
}

//#Preview {
//    GetInfoTextField(number: "", prompt: "예1234")
//}
