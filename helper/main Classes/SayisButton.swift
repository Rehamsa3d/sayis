//
//  SayisButton.swift
//  sayis
//
//  Created by ahmedxiio on 3/21/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class SayisButton:UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet{
            layer.shadowColor = shadowColor.cgColor
        }
    }
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet{
            layer.shadowOpacity = shadowOpacity
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet{
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet{
            layer.shadowOffset = shadowOffset
        }
    }
    

}
