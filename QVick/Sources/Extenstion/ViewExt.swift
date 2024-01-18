//
//  ViewExt.swift
//  QVick
//
//  Created by dgsw8th36 on 1/17/24.
//

import SwiftUI

extension View {
    
    func nextButton(destination: some View) -> some View {
        NextButton() {
            AnyView(self)
        } destination: {
            AnyView(destination)
        }
    }
    
}

@resultBuilder
struct LeaveOutBuilder {
    static func buildBlock(_ components: LeaveOutModel...) -> [LeaveOutModel] {
        components
    }
}
