//
//  HamburgerButton.swift
//  QVick
//
//  Created by dgsw8th32 on 1/18/24.
//

import SwiftUI

struct HamburgerButton: View {
    
    @State var isPresented: Bool = false
    
    let view: () -> AnyView
    
    var body: some View {
            
            Button(action: {
                print("Hello Bongsung!")
            }, label: {
                VStack(spacing: 5) {
                    
                    Rectangle()
                        .frame(width: 33, height: 4.5)
                    
                    Rectangle()
                        .frame(width: 33, height: 4.5)
                    
                    Rectangle()
                        .frame(width: 33, height: 4.5)
                }
                .foregroundStyle(.white)
            })
        
    }
}

#Preview {
    ZStack {
        Color.blueGray
        
        HamburgerButton {
            AnyView(EmptyView())
        }
        
    }
    .ignoresSafeArea()
    
}
