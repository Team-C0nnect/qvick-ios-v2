//
//  LeaveOutCell.swift
//  QVick
//
//  Created by dgsw8th16 on 1/18/24.
//

import SwiftUI

struct LeaveOutCell: View {
    
    let date: Date
    let reason: String
    var accept: Bool
    
    let dateFormatter = DateFormatter()
    
    init(date: Date, reason: String, accept: Bool) {
        self.date = date
        self.reason = reason
        self.accept = accept
        dateFormatter.dateFormat = "MM/dd"
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Text("\(dateFormatter.string(from: date))")
                .font(.pretendard(.bold, 13))
                
            Spacer(minLength: 70)
            
            Text("\(reason)")
                .font(.pretendard(.bold, 11))
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 70)
            
            Text("\(accept ? "승인" : "미승인")")
                .font(.pretendard(.bold, 13))
                .foregroundStyle(accept ? Color.baseGreen : Color.deepOrange)
                
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 8)
    }
}

#Preview {
    VStack(spacing: 30) {
        LeaveOutCell(date: Date.now, reason: "금정산데이트 다녀오겠습니다", accept: false)
        
        LeaveOutCell(date: Date.now.addingTimeInterval(1), reason: "금정산데이트 다녀오겠습니다", accept: false)
        
        LeaveOutCell(date: Date.now, reason: "금정산데이트", accept: false)
    }
}
