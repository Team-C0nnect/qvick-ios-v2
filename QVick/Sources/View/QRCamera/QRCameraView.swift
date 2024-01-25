//
//  QRCameraView.swift
//  QVick
//
//  Created by dgsw8th16 on 1/23/24.
//

import SwiftUI

struct QRCameraView: View {
    @State var inputImage: UIImage?
    @State var value: String = ""
    
    let valueFromController = NotificationCenter.default.publisher(for: NSNotification.Name("QR Scan"))
    
    var body: some View {
        QRCameraRepresentable(image: $inputImage, value: $value)
            .onReceive(valueFromController) { (output) in
                value = output.object as? String ?? ""
            }
            .overlay {
                VStack(spacing: 40) {
                    HStack {
                        Spacer()
                        
                        Button {} label: {
                            Image(systemName: "xmark")
                                .font(.judson(.bold, 20))
                                .foregroundStyle(Color.black)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Text("QR 코드를 인식하여 출석체크를 해 주세요")
                        .font(.judson(.bold, 16))
                    
                    Image("QRFrame")
                    
                    
                    Text("\(value)")
                    
                    Spacer()
                }
                .padding(.vertical, 10)
            }
    }
}

