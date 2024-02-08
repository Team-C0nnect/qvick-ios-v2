//
//  ApplicationView.swift
//  QVick
//
//  Created by dgsw8th32 on 1/23/24.
//

import SwiftUI

struct ApplicationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var selected = 1
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("외박/외출 신청")
                    .font(.judson(.bold, 30))
                    .foregroundStyle(.white)
                
                Spacer()
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundStyle(.white)
                })
            }
            .padding(.horizontal, 30)
            .padding(.top)
            
            
            HStack {
                Text("신청할 날짜와 시간 및 사유를 써주세요")
                    .font(.judson(.bold, 11))
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 20)
            
            Picker(selection: $selected, label: Text("Picker"), content: {
                Text("외박").tag(1)
                Text("외출").tag(2)
            })
            .pickerStyle(.segmented)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding(.horizontal, 30)
            
            if selected == 1 {
                SleepOverView()
            } else {
                LeaveOutView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blueGray)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ApplicationView()
}
