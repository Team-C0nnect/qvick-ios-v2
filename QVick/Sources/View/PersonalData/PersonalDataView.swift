//
//  PersonalDataView.swift
//  QVick
//
//  Created by dgsw8th16 on 1/16/24.
//

import SwiftUI

struct PersonalDataView: View {
    
    @StateObject var personalViewModel = PersonalDataViewModel()
    @State var isClick = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                
                VStack(spacing: 20) {
                    HStack(spacing: 0) {
                        Image(systemName: "chevron.left")
                            .font(.judson(.regular, 20))
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                        
                        Text("이용약관")
                            .font(.judson(.bold, 24))
                            .foregroundStyle(Color.white)
                            .padding(.trailing, 20)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    Rectangle()
                        .frame(width: 360, height: 1)
                        .foregroundStyle(Color.white)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Image("QvickLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("약관동의")
                            .font(.judson(.bold, 24))
                            .foregroundStyle(Color.white)
                        
                        Text("필수항목 및 선택항목 약관에 동의해 주세요")
                            .font(.judson(.bold, 15))
                            .foregroundStyle(Color.white)
                    }
                    
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.white, lineWidth: 1)
                        .frame(width: 340, height: 60)
                        .foregroundStyle(Color.clear)
                        .overlay {
                            HStack(spacing: 18) {
                                Button {
                                    withAnimation {
                                        isClick.toggle()
                                    }
                                } label: {
                                    ZStack {
                                        Circle()
                                            .strokeBorder(Color.white, lineWidth: 1)
                                            .frame(width: 25, height: 25)
                                        
                                        Image(systemName: "checkmark")
                                            .foregroundStyle(isClick ? .white : .clear)
                                            .fontWeight(.semibold)
                                    }
                                }
                                
                                Text("전체동의")
                                    .font(.judson(.bold, 15))
                                    .foregroundStyle(Color.white)
                                
                                Spacer()
                            }
                            .padding(.horizontal, 10)
                        }
                }
                
                VStack(spacing: 30) {
                    
                    ForEach(0 ..< personalViewModel.personModel.count, id: \.self) { index in
                        PersonalDataCell(label: "\(personalViewModel.personModel[index].label)", url: "/terms/privacy-policy", isClicked: isClick ? true : personalViewModel.personModel[index].isClicked) {
                            personalViewModel.getClickedSelection(index)
                        }
                    }
                    
                    
                }
                .padding(.horizontal, 28)
                
                Spacer()
                
            }
            .padding(.vertical, 30)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blackGray)
            .navigationBarBackButtonHidden()
            .nextButton(destination: ProfileView())
        }
    }
}

#Preview {
    PersonalDataView()
}
