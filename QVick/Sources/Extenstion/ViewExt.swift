//
//  ViewExt.swift
//  QVick
//
//  Created by dgsw8th36 on 1/17/24.
//

import SwiftUI

extension View {
    
    func nextButton(destination: some View, action: (() -> ())? = nil, disable: Bool = false ) -> some View {
        
        NextButton(content: {
            AnyView(self)
        }, destination: {
            AnyView(destination)
        }, action: {
            if let action = action  {
                action()
            }
            else {
                // noaction
            }
        }, disable: disable)
    }
    
}

@resultBuilder
struct LeaveOutBuilder {
    static func buildBlock(_ components: LeaveOutModel...) -> [LeaveOutModel] {
        components
    }
}
