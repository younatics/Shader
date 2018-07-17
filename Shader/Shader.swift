//
//  Shader.swift
//  Shader
//
//  Created by Seungyoun Yi on 2017. 9. 5..
//  Copyright © 2017년 Seungyoun Yi. All rights reserved.
//

import UIKit
import QuartzCore

public class Shader {
    public class func at(frame: CGRect, color: UIColor) -> UIView {
        let shaderView = UIView(frame: UIScreen.main.bounds)
        shaderView.backgroundColor = color
        
        let mutablePath = CGMutablePath()
        mutablePath.addRect(shaderView.bounds)
        mutablePath.addRect(frame)
        
        shaderView.layer.mask = shaderMask(path: mutablePath)
        return shaderView
    }
    
    public class func at(frame: CGRect, cornerRadius: CGFloat, color: UIColor) -> UIView {
        let shaderView = UIView(frame: UIScreen.main.bounds)
        shaderView.backgroundColor = color
        
        let bezierPath = UIBezierPath(rect: UIScreen.main.bounds)
        let cornerPath = UIBezierPath(roundedRect: frame, cornerRadius: cornerRadius)
        bezierPath.append(cornerPath)
        
        
        shaderView.layer.mask = shaderMask(path: bezierPath.cgPath)
        return shaderView
    }
    
    public class func at(frames: [CGRect], color: UIColor) -> UIView {
        let shaderView = UIView(frame: UIScreen.main.bounds)
        shaderView.backgroundColor = color
        
        let mutablePath = CGMutablePath()
        mutablePath.addRect(shaderView.bounds)
        for frame in frames {
            mutablePath.addRect(frame)
        }
        
        shaderView.layer.mask = shaderMask(path: mutablePath)
        return shaderView
    }
    
    public class func at(framesAndRadius:[(frame: CGRect, cornerRadius: CGFloat)], color: UIColor) -> UIView {
        let shaderView = UIView(frame: UIScreen.main.bounds)
        shaderView.backgroundColor = color
        
        let bezierPath = UIBezierPath(rect: UIScreen.main.bounds)
        for frameAndRadius in framesAndRadius {
            let cornerPath = UIBezierPath(roundedRect: frameAndRadius.frame, cornerRadius: frameAndRadius.cornerRadius)
            bezierPath.append(cornerPath)
        }
        
        shaderView.layer.mask = shaderMask(path: bezierPath.cgPath)
        return shaderView
    }
    
    private class func shaderMask(path:CGPath) -> CAShapeLayer {
        let mask = CAShapeLayer()
        mask.path = path
        #if swift(>=4.2)
        mask.fillRule = CAShapeLayerFillRule.evenOdd
        #else
        mask.fillRule = kCAFillRuleEvenOdd
        #endif

        return mask
    }
}
