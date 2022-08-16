//
//  SignIpView.swift
//  test
//
//  Created by USER11 on 8/16/22.
//

import UIKit

class SignInView: UIView {
    
    required init?(coder: NSCoder) {
            fatalError()
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.setupUI()
        }
        
    private func setupUI () {
        backgroundColor = .white
    }
}
