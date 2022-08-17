//
//  LoginView.swift
//  test
//
//  Created by USER11 on 8/16/22.
//

import UIKit

class LoginView: UIView {
    
    //MARK: - Variables
    
    var isRememberMe = true
    
    //MARK: - UI Elements
    
    private lazy var emailLabel = getLabel(text: "Email",
                                           size: 14,
                                           weigth: .regular,
                                           color: "#231F20")
    
    private lazy var passwordLabel = getLabel(text: "Password",
                                              size: 14,
                                              weigth: .regular,
                                              color: "#231F20")
    
    private lazy var emailTextField: TextField = {
        let field = TextField()
        let color = hexStringToUIColor(hex: "#D0D0CE")
        field.attributedPlaceholder = NSAttributedString(
            string: "Enter your email",
            attributes: [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular)])
        field.layer.cornerRadius = 10
        field.clipsToBounds = true
        field.layer.borderWidth = 1
        let borderColor = hexStringToUIColor(hex: "#D0D0CE")
        field.layer.borderColor = borderColor.cgColor
        
        field.textColor = hexStringToUIColor(hex: "#231F20")
        field.font = .systemFont(ofSize: 14, weight: .semibold)
        
        return field
    }()
    
    private lazy var passwordTextField: TextField = {
        let field = TextField()
        let color = hexStringToUIColor(hex: "#D0D0CE")
        field.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular)])
        field.layer.cornerRadius = 10
        field.clipsToBounds = true
        field.layer.borderWidth = 1
        let borderColor = hexStringToUIColor(hex: "#D0D0CE")
        field.layer.borderColor = borderColor.cgColor
        
        field.textColor = hexStringToUIColor(hex: "#231F20")
        field.font = .systemFont(ofSize: 14, weight: .semibold)
        
        field.rightViewMode = UITextField.ViewMode.always
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 18, height: 12))
        imageView.contentMode = .center
        let image = UIImage(named: "eye")
        
        let emptyView = UIView(frame: CGRect(x: 0, y: 0, width: 33, height: 15))
        emptyView.backgroundColor = .clear
        emptyView.addSubview(imageView)
        
        imageView.image = image
        field.rightView = emptyView
        
        return field
    }()
    
    private lazy var rememberMeBox: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        
        button.layer.borderColor = hexStringToUIColor(hex: "#D0D0CE").cgColor
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        
        button.addTarget(self,
                         action: #selector(didTapRememberMe),
                         for: .touchUpInside)
        
        return button
    }()
    
    private lazy var rememberMeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Remember me", for: .normal)
        
        let color = hexStringToUIColor(hex: "63666A")
        
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        
        button.addTarget(self,
                         action: #selector(didTapRememberMe),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot password?", for: .normal)
        
        let color = hexStringToUIColor(hex: "FFB500")
        
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        
        button.addTarget(self,
                         action: #selector(didTapForgotPassword),
                         for: .touchUpInside)
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    //MARK: - Functions
    
    private func setupUI () {
        backgroundColor = .white
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(rememberMeBox)
        addSubview(forgotPasswordButton)
        addSubview(rememberMeButton)
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.left.equalToSuperview().offset(25)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.top.equalTo(emailLabel.snp.bottom).offset(12)
            make.height.equalTo(50)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.top.equalTo(emailTextField.snp.bottom).offset(23)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.top.equalTo(passwordLabel.snp.bottom).offset(12)
            make.height.equalTo(50)
        }
        
        rememberMeBox.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.top.equalTo(passwordTextField.snp.bottom).offset(14)
            make.height.width.equalTo(20)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(rememberMeBox.snp.centerY)
            make.right.equalToSuperview().offset(-25)
        }
        
        rememberMeButton.snp.makeConstraints { make in
            make.centerY.equalTo(rememberMeBox.snp.centerY)
            make.left.equalTo(rememberMeBox.snp.right).offset(10)

        }
    }
    
    @objc private func didTapView() {
        
    }
    
    private func getLabel(text: String, size: Int, weigth: UIFont.Weight, color: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: CGFloat(size), weight: weigth)
        label.textColor = hexStringToUIColor(hex: color)
        return label
    }
    
    @objc private func didTapRememberMe() {
        if isRememberMe {
            rememberMeBox.backgroundColor = .systemGreen
            isRememberMe = false
        } else {
            rememberMeBox.backgroundColor = .white
            isRememberMe = true
        }
    }
    
    @objc private func didTapForgotPassword() {
        print("Forgot password")
    }
}


