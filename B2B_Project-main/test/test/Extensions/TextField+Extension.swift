//
//  TextFieldEXT.swift
//  test
//
//  Created by Ismayil Ismayilov on 17.08.22.
//

import Foundation
import UIKit

class EmailTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: self.frame.size.width - 45, bottom: 0, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
       }

       required override init(frame: CGRect) {
           super.init(frame: frame)
       }
}

class PasswordTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 5)
    
    let right_padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
    
    let rightButton  = UIButton(type: .custom)
    
    required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           commonInit()
       }

       required override init(frame: CGRect) {
           super.init(frame: frame)
           commonInit()
       }

       func commonInit() {
           rightButton.setImage(UIImage(named: "ic_hidePassword") , for: .normal)
           rightButton.addTarget(self, action: #selector(toggleShowHide), for: .touchUpInside)
           rightButton.frame = CGRect(x:0, y:0, width:30, height:30)

           rightViewMode = .always
           rightView = rightButton
           isSecureTextEntry = true
       }

       @objc
       func toggleShowHide(button: UIButton) {
           toggle()
       }

       func toggle() {
           isSecureTextEntry = !isSecureTextEntry
           if isSecureTextEntry {
               rightButton.setImage(UIImage(named: "ic_hidePassword") , for: .normal)
           } else {
               rightButton.setImage(UIImage(named: "ic_showPassword") , for: .normal)
           }
       }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: self.frame.size.width - 45, bottom: 0, right: 0))
    }
}

class SignUpTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: self.frame.size.width - 45, bottom: 0, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
