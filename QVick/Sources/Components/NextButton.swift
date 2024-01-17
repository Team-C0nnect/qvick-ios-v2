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
    
    init(content: @escaping () -> AnyView, destination: @escaping () -> AnyView) {
        self.content = content
        self.destination = destination
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            content()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            NavigationLink {
                
                destination()
                
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
            
        }
        .ignoresSafeArea(.container)
        
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
