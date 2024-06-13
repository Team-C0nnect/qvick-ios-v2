//
//  PersonalInfoView.swift
//  QVick
//
//  Created by dgsw8th36 on 1/23/24.
//

import SwiftUI
import Alamofire

struct PersonalInfoView: View {
    
    let title: String
    let url: String
    
    
    @Environment(\.presentationMode) var presentationMode
    @State var text: String = ""
    
    
    var body: some View {
        VStack {
            
            VStack(spacing: 20) {
                HStack {
                    
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.pretendard(.regular, 20))
                            .foregroundStyle(Color.white)
                    }
                    
                    Spacer()
                    
                    Text(title)
                        .font(.pretendard(.bold, 24))
                        .foregroundStyle(Color.white)
                        .padding(.trailing, 20)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            
            Rectangle()
                .frame(width: 360, height: 1)
                .foregroundStyle(Color.white)
            
            HStack {
                
                Image("QvickLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                
                Spacer()
                
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 10)
            
            ScrollView {
                Text("\(text)")
                    .font(.pretendard(.bold, 24))
                    .foregroundStyle(Color.white)
                    .padding(.horizontal, 10)
            }
            
        }
        .padding(.vertical, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blackGray)
        .onAppear {
            AF.request("\(Constant.url)\(url)",
                       method: .get
            )
            .response { response in
                switch response.result {
                case .success(let data):
                    self.text = String(htmlEncodedString: String(decoding: data ?? .init(), as: UTF8.self)) ?? ""
                case .failure(_):
                    break
                }
            }
        }
        .navigationBarBackButtonHidden()
        
    }
}


