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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shaderView = Shader.at(frame: originView.frame)
        self.view.addSubview(shaderView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

