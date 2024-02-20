//
//  PersonalDataCell.swift
//  QVick
//
//  Created by dgsw8th32 on 1/16/24.
//

import SwiftUI

struct PersonalDataCell: View {
    
    var label: String
    var url: String
    let action: () -> Void
    var isClicked: Bool
    
    init(label: String, url: String, isClicked: Bool, action: @escaping () -> Void) {
        self.label = label
        self.url = url
        self.isClicked = isClicked
        self.action = action
    }
    
    @State var isPresented: Bool = false
    
    var body: some View {
        HStack {
            
            Button(action: {
                action()
            }, label: {
                Circle()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(.clear)
                    .overlay {
                        ZStack {
                            Circle().stroke(.white, lineWidth: 1)
                            
                            Image(systemName: "checkmark")
                                .font(.system(size: 12).weight(.semibold))
                                .foregroundStyle(isClicked ? .white : .clear)
                                
                        }
                    }
            })
            .padding(.leading)
            .padding(.trailing)
            
            Text(label)
                .font(.judson(Judson.bold, 15))
                .foregroundStyle(.white)
            
            Spacer()
            
            Button {
                isPresented.toggle()
            } label: {
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 10, height: 20)
                    .foregroundStyle(.white)
                    
            }
            .padding(.trailing)
        }
        .sheet(isPresented: $isPresented) {
            if #available(iOS 16.0, *) {
                WebView(url: url)
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
            else {
                WebView(url: url)
            }
        }
    }
}

