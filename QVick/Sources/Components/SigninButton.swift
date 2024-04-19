//
//  SigninButton.swift
//  QVick
//
//  Created by dgsw8th36 on 1/17/24.
//

import SwiftUI

struct SigninButton: View {
    
    let imageName: String
    let action: () -> Void
    
    var body: some View {
        ZStack {
            Button {
                action()
            } label: {
                
                RoundedRectangle(cornerRadius: 40)
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.white)
                    .overlay {
                        Image("\(imageName)")
                    }
                
            }
            
        }
    }
}

#Preview {
    ZStack {
        Color.gray
        SigninButton(imageName: "DodamIcon") {
            print("신민호")
        }
    }
}
