//
//  ViewController.swift
//  ShaderDemo
//
//  Created by Seungyoun Yi on 2017. 9. 5..
//  Copyright © 2017년 Seungyoun Yi. All rights reserved.
//

import UIKit
import Shader

class ViewController: UIViewController {
    @IBOutlet var originView: UIView!
    @IBOutlet var originView2: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        originView.layer.cornerRadius = 50
        
        let shaderView = Shader.at(frame: originView.frame, color: UIColor.blue.withAlphaComponent(0.3))
//        let shaderView = Shader.at(frames: [originView.frame, originView2.frame], color: UIColor.black.withAlphaComponent(0.5))
//        let shaderView = Shader.at(frame: originView.frame, cornerRadius: 50, color: UIColor.black.withAlphaComponent(0.5))
        self.view.addSubview(shaderView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

