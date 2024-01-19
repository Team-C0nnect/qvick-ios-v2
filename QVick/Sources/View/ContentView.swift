//
//  ContentView.swift
//  QVick
//
//  Created by dgsw8th16 on 1/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PersonalDataViewModel()
    
    var body: some View {
        Text("w")
            .onAppear {
                print(Constant.url)
            }
    }
}

#Preview {
    ContentView()
}
