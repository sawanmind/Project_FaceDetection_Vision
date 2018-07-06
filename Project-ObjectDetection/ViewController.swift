//
//  ViewController.swift
//  Project-ObjectDetection
//
//  Created by iOS Development on 7/5/18.
//  Copyright © 2018 Genisys. All rights reserved.
//

import UIKit
import Vision
import AVFoundation

class ViewController: UIViewController {

    

    var previewLayer = PreviewLayer()
    var cameraController : CameraController?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(previewLayer)
        previewLayer.frame = self.view.bounds
        cameraController = CameraController(previewLayer: self.previewLayer, controller: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cameraController?.checkForSession()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        cameraController?.removeSession()
        super.viewWillDisappear(animated)
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        cameraController?.sessionOrrientation()
    }
    
   
    
}

