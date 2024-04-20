//
//  QRCameraRepresentable.swift
//  QVick
//
//  Created by dgsw8th16 on 1/23/24.
//

import SwiftUI
import AVFoundation

struct QRCameraRepresentable: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var value: String
    
    func makeUIViewController(context: Context) -> QRCameraController {
        let controller = QRCameraController()
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: QRCameraController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, AVCapturePhotoCaptureDelegate {
        let parent: QRCameraRepresentable
        
        init(_ parent: QRCameraRepresentable) {
            self.parent = parent
        }
        
        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
            
            if let imageData = photo.fileDataRepresentation() {
                parent.image = UIImage(data: imageData)
            }
        }
    }
}




