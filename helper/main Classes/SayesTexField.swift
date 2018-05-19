//
//  custom text.swift
//  sayis
//
//  Created by ahmedxiio on 3/21/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable

class SayesTexField: UITextField {
    
    var rightIcon = UIImage()
    
    @IBInspectable var icon:UIImage? {
        set {
            self.rightIcon = newValue ?? UIImage()
        }
        get {
            return self.rightIcon
        }
    }
    
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

    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        self.layer.cornerRadius = 15
//        self.layer.maskedCorners = CACornerMask(rawValue: 15)
//        self.clipsToBounds = true
//        let view = UIView(frame:  CGRect(x:0,y:0,width:40,height:40))
//        let imageView = UIImageView();
//        imageView.frame = CGRect(x:8,y:8,width:24,height:24)
//        imageView.image = rightIcon;
//        view.addSubview(imageView)
//        self.rightView = view;
//        self.rightViewMode = .always
//        
//        //shadow
//        self.layer.masksToBounds = false
//        self.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
//        self.layer.shadowOpacity = 0.9
//        self.layer.shadowRadius = 5
//        self.layer.shadowOffset = CGSize.zero
//
//        
//    }
}
