//
//  DatePicker.swift
//  QVick
//
//  Created by dgsw8th32 on 1/23/24.
//

import SwiftUI

struct DatePickerCell: View {
    @State var date = Date()
    @State var label = ""
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                
                Rectangle()
                    .frame(width: 120, height: 30)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 30)
            }
            
            DatePicker(selection: $date, in: Date()..., displayedComponents: .date) {
                Text(label)
                    .font(.pretendard(.bold, 15))
                    .foregroundStyle(.white)
            }
            .padding(.horizontal, 30)
            .tint(.blueGray)
            .foregroundStyle(.white)
                
        }
    }
}


#Preview {
    DatePickerCell(label: "외박 날짜")
        .background(Color.blueGray)
}
