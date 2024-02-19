//
//  NextButton.swift
//  QVick
//
//  Created by dgsw8th36 on 1/17/24.
//

import SwiftUI

struct NextButton: View {
    
    let content: () -> AnyView
    let destination: () -> AnyView
    let action: () -> Void
    let disable: Bool
    
    init(content: @escaping () -> AnyView, destination: @escaping () -> AnyView, action: @escaping () -> Void, disable: Bool = false) {
        self.content = content
        self.destination = destination
        self.action = action
        self.disable = disable
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            content()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            NavigationLink {
                
                destination()
                    .onAppear {
                        action()
                    }
                
            } label: {
                
                Rectangle()
                    .frame(height: 70)
                    .foregroundStyle(Color.baseGreen)
                    .overlay {
                        Text("다음")
                            .font(.judson(Judson.bold, 15))
                            .foregroundStyle(Color.white)
                    }
                
            }
            .disabled(disable)
            
            
        }
        .ignoresSafeArea(.all, edges: .bottom)
        
        
    }
}

#Preview {
    NavigationStack {
        ZStack {
            
            Color.BaseGray
                .ignoresSafeArea()
            
            VStack {
                
                Text("건우건우")
                Text("건우건우")
                Text("건우건우")
                Text("건우건우")
                Text("건우건우")
                
            }
            .nextButton(destination: SchoolSelectionView())

        }
    }
}
