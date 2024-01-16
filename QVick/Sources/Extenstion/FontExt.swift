//
//  FontExt.swift
//  QVick
//
//  Created by dgsw8th36 on 1/16/24.
//

import SwiftUI

enum Judson: String {
    
    case bold = "Judson-Bold"
    case italic = "Judson-Italic"
    case regular = "Judson-Regular"
}

extension Font {
    static func judson(_ judson: Judson, _ size: CGFloat) -> Font {
        return Font.custom(judson.rawValue, size: size)
    }
}
