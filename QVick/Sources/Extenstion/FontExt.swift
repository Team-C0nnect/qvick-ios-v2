//
//  FontExt.swift
//  QVick
//
//  Created by dgsw8th36 on 1/16/24.
//

import SwiftUI

enum Pretendard: String {
    case black = "Pretendard-Black"
    case bold = "Pretendard-Bold"
    case extraBold = "Pretendard-ExtraBold"
    case extraLight = "Pretendard-ExtraLight"
    case light = "Pretendard-Light"
    case medium = "Pretendard-Medium"
    case regular = "Pretendard-Regular"
    case semiBold = "Pretendard-SemiBold"
    case thin = "Pretendard-Thin"
}

enum Judson: String {
    
    case bold = "Judson-Bold"
    case italic = "Judson-Italic"
    case regular = "Judson-Regular"
}

extension Font {
    static func judson(_ judson: Judson, _ size: CGFloat) -> Font {
        return Font.custom(judson.rawValue, size: size)
    }
    
    static func pretendard(_ pretendard: Pretendard, _ size: CGFloat) -> Font {
        return Font.custom(pretendard.rawValue, size: size)
    }
}
