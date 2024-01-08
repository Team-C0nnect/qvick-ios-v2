//
//  HomeView.swift
//  QVick
//
//  Created by dgsw8th16 on 1/8/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("출석 체크")
                .font(.custom("AzeretMono-SemiBold", size: 30))
            
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 130)
            
            Text("외박신청 목록")
                .font(.custom("AzeretMono-SemiBold", size: 30))
        }
    }
}



#Preview {
    HomeView()
}
