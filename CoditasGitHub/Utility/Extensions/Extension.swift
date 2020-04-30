//
//  Extension.swift
//  CoditasGitHub
//
//  Created by Apple on 30/04/20.
//  Copyright © 2020 Ajay Ranekar. All rights reserved.
//

import Foundation
import UIKit


// MARK:- UIViewController Extension

extension UIViewController {
    
    func alert(message: String) -> Void {
        let alert = UIAlertController.init(title: Constant.PROJECT_NAME, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: Constant.OK, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}


// MARK:- IBDesignable Extension

@IBDesignable
class CardView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 1
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.3
    @IBInspectable var shadowRadius: CGFloat = 2
    
    @IBInspectable var borderRadius: CGFloat = 0
    
    @IBInspectable var borderColor: UIColor = .black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowColor = borderColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
}
