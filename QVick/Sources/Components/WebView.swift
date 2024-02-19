//
//  WebView.swift
//  QVick
//
//  Created by dgsw8th16 on 1/17/24.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: "\(Constant.url)\(self.url)") else {
            return WKWebView()
        }
        
        let webView = WKWebView()
        
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}

#Preview {
    WebView(url: "/terms/privacy-policy")
    
}

