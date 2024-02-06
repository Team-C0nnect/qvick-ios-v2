//
//  ViewExt.swift
//  QVick
//
//  Created by dgsw8th36 on 1/17/24.
//

import SwiftUI

extension View {
    
    func nextButton(destination: some View, action: (() -> ())? = nil ) -> some View {
        
        NextButton() {
            AnyView(self)
        } destination: {
            AnyView(destination)
        } action: {
            if let action = action {
                action()
            } else {
                print("error")
            }
        }
    }
    
}

@resultBuilder
struct LeaveOutBuilder {
    static func buildBlock(_ components: LeaveOutModel...) -> [LeaveOutModel] {
        components
    }
}
