//
//  SecondViewController.swift
//  BerraDrive
//
//  Created by George on 11/15/18.
//  Copyright © 2018 Tyler Harriott. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var video = AVCaptureVideoPreviewLayer()
    let session = AVCaptureSession()
    
    
    
    @IBOutlet weak var square: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //Creating session
       // let session = AVCaptureSession()
        
        //Define Capture device
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
            
        } catch {
            print (">>>>Error")
            
        }
        
        let output = AVCaptureMetadataOutput ()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        
        self.view.bringSubviewToFront(square)
        
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        if metadataObjects != nil && metadataObjects.count != 0 {
            
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject{
                
                if object.type == AVMetadataObject.ObjectType.qr{
               
                    
                     let tabbar = tabBarController as! MyTabBarController
                    //Sets a delay of 1 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                       
                        UserDefaults.standard.set(object.stringValue, forKey: "FloorKey")
                        tabbar.theValue = object.stringValue!
                        self.tabBarController?.selectedIndex = 0
                       
                    }
                    
                }
            }
            
        }
        
    }
    
   

    
    override func viewWillAppear(_ animated: Bool) {
        session.startRunning()
        print("Start running")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        session.stopRunning()
        print ("Stop running")
        

    }
    
   
    
    
    
}

