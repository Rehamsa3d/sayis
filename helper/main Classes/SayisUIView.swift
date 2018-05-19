//
//  SayisUIView.swift
//  sayis
//
//  Created by ahmedxiio on 4/4/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable

class SayisUIView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
}
