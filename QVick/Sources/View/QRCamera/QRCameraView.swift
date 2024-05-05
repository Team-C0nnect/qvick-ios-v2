//
//  QRCameraView.swift
//  QVick
//
//  Created by dgsw8th16 on 1/23/24.
//

import SwiftUI
import Alamofire

struct QRCameraView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var inputImage: UIImage?
    @State var value: String = ""
    
    let valueFromController = NotificationCenter.default.publisher(for: NSNotification.Name("QR Scan"))
    
    var body: some View {
        QRCameraRepresentable(image: $inputImage, value: $value)
            .onReceive(valueFromController) { (output) in
                value = output.object as? String ?? ""
                
                if value != "" {
                    let header: HTTPHeaders = ["Authorization": "Bearer \(KeyChain.read()?.accessToken ?? "")"]
                    
                    
                    AF.request(
                        "\(Constant.url)/attendance",
                        method: .post,
                        parameters: ["code": value] as Dictionary,
                        encoding: JSONEncoding(),
                        headers: header
                    )
                    .validate()
                    .response { response in
                        if let statuscode = response.response?.statusCode {
                            if statuscode == StatusCode.success.rawValue {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                            
                        }
                    }
                }
            }
            .overlay {
                VStack(spacing: 40) {
                    HStack {
                        Spacer()
                        
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .font(.pretendard(.bold, 20))
                                .foregroundStyle(Color.black)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Text("QR 코드를 인식하여 출석체크를 해 주세요")
                        .font(.pretendard(.bold, 16))
                    
                    Image("QRFrame")
                    
                    Spacer()
                }
                .padding(.vertical, 10)
            }
    }
}
