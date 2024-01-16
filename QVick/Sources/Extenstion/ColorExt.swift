//
//  ColorExt.swift
//  QVick
//
//  Created by dgsw8th36 on 1/16/24.
//

import SwiftUI

extension Color {
    
    // gray
    static public let lightGray = Color(0xD9D9D9)
    static public let BaseGray = Color(0x8C8C8C)
    static public let blueGray = Color(0x3A3F4A)
    static public let blackGray = Color(0x343A47)
    
    // red
    static public let deepOrange = Color(0xFF6058)
    
    // green
    static public let baseGreen = Color(0x41C982)
    
    // blue
    static public let skyBlue = Color(0xADCEFF)
    static public let baseBlue = Color(0x5278FF)
    
}

extension Color {
    
    // hex to color
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
