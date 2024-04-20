//
//  LeaveOutList.swift
//  QVick
//
//  Created by dgsw8th16 on 1/18/24.
//

import SwiftUI

struct LeaveOutList: View {
    let leaveOutList: [LeaveOutModel]
    
    init(@LeaveOutBuilder leaveOutList: () -> [LeaveOutModel]) {
        self.leaveOutList = leaveOutList()
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundStyle(Color.white)
            .frame(width: 340, height: 224)
            .overlay {
                VStack {
                    HStack {
                        Text("날짜")
                        
                            Spacer()
                        
                        Text("사유")
                        
                            Spacer()
                        
                        Text("승인")
                    }
                    .font(.pretendard(.bold, 13))
                    .padding(.horizontal, 45)
                    
                    ForEach(0..<leaveOutList.count) { i in
                        LeaveOutCell(date: leaveOutList[i].date, reason: leaveOutList[i].reason, accept: leaveOutList[i].accept)
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(.vertical, 8)
            }
    }
}

#Preview {
    VStack {
        LeaveOutList {
            LeaveOutModel(id: 0, date: Date.now, reason: "ws", accept: false)
        }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.blackGray)
    
}
