//
//  Reason Cell.swift
//  QVick
//
//  Created by dgsw8th32 on 1/23/24.
//

import SwiftUI

struct ReasonCell: View {
    @State var label: String = ""
    @State var title: String = ""
    @State var placeholder: String = ""
    
    var body: some View {
        HStack {
            Text(title)
                .font(.pretendard(.bold, 15))
                .foregroundStyle(.white)
            
            Spacer()
            
            TextField(placeholder, text: $label)
                .frame(width: 245, height: 35)
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 30)
    }
}

#Preview {
    ReasonCell(title: "외박 사유", placeholder: " 외박사유를 적어주세요")
        .background(Color.blueGray)
}
