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
        
        Button {
            viewModel.getClickedSelection(0)
            print(viewModel.personModel[0].isClicked)
        } label: {
            Text("\(viewModel.personModel[0].label)")
        }
    }
}

#Preview {
    ContentView()
}
