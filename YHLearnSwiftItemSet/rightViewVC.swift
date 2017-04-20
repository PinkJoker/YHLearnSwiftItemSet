//
//  rightViewVC.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/19.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit
import AVFoundation
class rightViewVC: UIViewController {

    var cameraView:UIView?
    
    var captureSession:AVCaptureSession?
    var stillImageOutput:AVCapturePhotoOutput?
    var previewLayer:AVCaptureVideoPreviewLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer?.frame = self.view.bounds
    }
    override func viewWillAppear(_ animated: Bool) {
        captureSession = AVCaptureSession.init()
        captureSession?.sessionPreset = AVCaptureSessionPresetLow
        
        let backCamera = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        var error = NSError()
        var input:AVCaptureInput?
        
        do {
             input = try AVCaptureDeviceInput(device: backCamera)
        } catch let error1 as NSError {
            error = error1
            input = nil
        }
        
        if captureSession?.canAddInput(input) != nil{
            captureSession?.addInput(input)
            stillImageOutput = AVCapturePhotoOutput()
//            stillImageOutput?.photoSettingsForSceneMonitoring = 
//            stillImageOutput?.preparedPhotoSettingsArray =  [AVVideoCodecKey : AVVideoCodecJPEG]
            if (captureSession?.canAddOutput(stillImageOutput) != nil) {
                captureSession?.addOutput(stillImageOutput)
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.portrait
                cameraView?.layer.addSublayer(previewLayer!)
                captureSession?.stopRunning()
            }
        }
    }
    var tempImageView:UIImageView?
    var didTakePhoto = Bool()
    func didPressTakePhoto(){
        if let videoConnection = stillImageOutput?.connection(withMediaType: AVMediaTypeVideo){
            videoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
//            stillImageOutput?.capturePhoto(with: <#T##AVCapturePhotoSettings#>, delegate: <#T##AVCapturePhotoCaptureDelegate#>)
//            
       }
        
    }
    
    
    
    
    
    
    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
