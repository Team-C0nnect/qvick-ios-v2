//
//  TimeCell.swift
//  QVick
//
//  Created by dgsw8th32 on 1/23/24.
//

import SwiftUI

struct TimeCell: View {
    @State var date = Date()
    @State var label = ""
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                
                Rectangle()
                    .frame(width: 85, height: 30)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 30)
            }
            
            DatePicker(selection: $date, in: Date()..., displayedComponents: .hourAndMinute) {
                Text(label)
                    .font(.judson(.bold, 15))
                    .foregroundStyle(.white)
            }
            .padding(.horizontal, 30)
            .tint(.blueGray)
            .foregroundStyle(.white)
                
        }
    }
}

#Preview {
    TimeCell(label: "외박 시간")
        .background(Color.blueGray)
}
