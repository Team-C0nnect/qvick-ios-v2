//
//  LeaveOutView.swift
//  QVick
//
//  Created by dgsw8th32 on 1/23/24.
//

import SwiftUI

struct LeaveOutView: View {
    var body: some View {
        VStack {
            DatePickerCell(label: "외출날짜")
            
            TimeCell(label: "외출시간")
            
            TimeCell(label: "복귀시간")
            
            ReasonCell(title: "외출사유", placeholder: " 외출사유를 적어주세요")
            
            Spacer()
            
            ApplicationButton(action: "외출 신청")
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blueGray)
    }
}

#Preview {
    LeaveOutView()
}
