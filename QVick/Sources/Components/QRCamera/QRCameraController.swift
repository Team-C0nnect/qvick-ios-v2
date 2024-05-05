//
//  QRCameraController.swift
//  QVick
//
//  Created by dgsw8th16 on 1/23/24.
//

import UIKit
import AVFoundation

class QRCameraController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var image: UIImage?
    
    var captureSession = AVCaptureSession()
    
    var backCamera: AVCaptureDevice?
    var currentCamera: AVCaptureDevice?
    
    
    var photoOutput: AVCapturePhotoOutput?
    
    var metadataOutput: AVCaptureMetadataOutput?
    
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    
    var value: String = ""
    
    var delegate: AVCapturePhotoCaptureDelegate?
    
    func didTapRecord() {
        let settings = AVCapturePhotoSettings()
        
        photoOutput?.capturePhoto(with: settings, delegate: delegate!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        setUpCaptureSession()
        setUpDevice()
        setUpInOutPut()
        setupPreviewLayer()
        DispatchQueue.global().async {
            self.captureSession.startRunning()
        }
        
    }
    
    func setUpCaptureSession() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    
    func setUpDevice() {
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        
        for device in deviceDiscoverySession.devices {
            switch device.position {
            case AVCaptureDevice.Position.back:
                self.backCamera = device
            default:
                break
            }
        }
        
        self.currentCamera = self.backCamera
    }
        
    func setUpInOutPut() {
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
            
            captureSession.addInput(captureDeviceInput)
            photoOutput = AVCapturePhotoOutput()
            
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
            
            captureSession.addOutput(photoOutput!)
            metadataOutput = AVCaptureMetadataOutput()
            
            if let metadataOutput = metadataOutput {
                captureSession.addOutput(metadataOutput)
                metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                
                metadataOutput.metadataObjectTypes = [.qr]
            } else {
                return
            }
            
        } catch {
            
            
        }
    }
    
    func setupPreviewLayer() {
        self.cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.cameraPreviewLayer?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.layer.insertSublayer(cameraPreviewLayer!, at: 0)
        
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first {
            guard let readable = metadataObject as? AVMetadataMachineReadableCodeObject else {
                return
            }
            guard let stringValue = readable.stringValue else {
                return
            }
            if value != stringValue {
                value = stringValue
                NotificationCenter.default.post(name: NSNotification.Name("QR Scan"), object: stringValue)
            }
        }
    }
    
    
}
