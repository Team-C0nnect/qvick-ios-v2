//
//  SleepOverView.swift
//  QVick
//
//  Created by dgsw8th32 on 1/23/24.
//

import SwiftUI

struct SleepOverView: View {
    var body: some View {
        VStack {
            
            DatePickerCell(label: "외박 날짜")
            
            DatePickerCell(label: "복귀 날짜")
            
            TimeCell(label: "외박 시간")
            
            TimeCell(label: "복귀 시간")
            
            ReasonCell(title: "외박사유", placeholder: " 외박사유를 적어주세요")
            
            Spacer()
            
            ApplicationButton(action: "외박 신청")
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blueGray)
    }
}

#Preview {
    SleepOverView()
}
