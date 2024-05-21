//
//  QVickApp.swift
//  QVick
//
//  Created by dgsw8th16 on 1/8/24.
//

import SwiftUI

@main
struct QVickApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Group {
                    if KeyChain.read() == nil {
                        SigninView()
                    }
                    else {
                        MainView()
                    }
                            
                    
                }
                .navigationBarHidden(true)
                    
            }
        }
    }
}
