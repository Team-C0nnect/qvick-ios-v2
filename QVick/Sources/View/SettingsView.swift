//
//  SettingsView.swift
//  QVick
//
//  Created by dgsw8th32 on 1/22/24.
//

import SwiftUI

struct SettingsView: View {
    @State var isOn: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Image("QvickLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75)
                
                Spacer()
                
                Button(action: {
                    print("Get out!")
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.white)
                })
            }
            .padding(.horizontal, 35)
            
            Button(action: {print("프로필")}, label: {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 345, height: 105)
                    .foregroundStyle(.clear)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20).stroke(.white, lineWidth: 1.5)
                        
                        HStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .foregroundStyle(.black)
                            
                            Spacer()
                            
                            Text("1116 신민호")
                                .font(.judson(.bold, 30))
                                .foregroundStyle(.white)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 15)
                    }
                    .padding(.vertical, 30)
            })
            
            HStack {
                Text("알림")
                    .font(.judson(.bold, 20))
                    .foregroundStyle(.white)
                
                Spacer()
                
                ToggleButton(isOn: $isOn)
            }
            .padding(.horizontal, 40)
            
            HStack {
                Button(action: {
                    print("외박신청 클릭!")
                }, label: {
                    Text("외박신청")
                        .font(.judson(.bold, 20))
                        .foregroundStyle(.white)
                })
                
                Spacer()
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 90)
            
            HStack {
                Button(action: {print("개인정보 약관")}, label: {
                    VStack(spacing: 2) {
                        Text("개인정보 약관")
                            .font(.judson(.bold, 20))
                            .foregroundStyle(.white)
                        
                        Rectangle()
                            .frame(width: 110, height: 1)
                            .foregroundStyle(.white)
                    }
                })
                
                Spacer()
            }
            .padding(.horizontal, 40)
            
            Spacer()
            
        }
        .padding(.vertical, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blueGray)
    }
}

#Preview {
    SettingsView()
}
