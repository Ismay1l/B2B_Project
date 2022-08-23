//
//  LoginView.swift
//  test
//
//  Created by USER11 on 8/16/22.
//

import UIKit

class LoginView: UIView {
    
    //MARK: - Variables
    
    let successView = SuccessVC()
    
    var isRememberMe = true
    
    var isPasswordHidden = true
    
    var delegate: LoginViewDelegate?
    
    //MARK: - UI Elements
    
    lazy var emailStackView = getStackView()
    
    private lazy var passwordStackView = getStackView()
    
    lazy var wrongPasswordAlertLabel = getLabel(text: "Caption text, description, error notification",
                                                        size: 12, weigth: .regular,
                                                        color: "FF3D71")
    
    lazy var wrongEmailAlertLabel = getLabel(text: "Caption text, description, error notification",
                                             size: 12, weigth: .regular,
                                             color: "FF3D71")
    
    
    
    private lazy var emailLabel = getLabel(text: "Email",
                                           size: 14,
                                           weigth: .regular,
                                           color: "#231F20")
    
    lazy var passwordLabel = getLabel(text: "Password",
                                              size: 14,
                                              weigth: .regular,
                                              color: "#231F20")
    
    lazy var emailTextField = getEmailTextField()
    
    lazy var passwordTextField: PasswordTextField = {
        let field = PasswordTextField()
        let textColor = CustomColors.placeHolderColor
        field.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular)])
        field.layer.cornerRadius = 10
        field.clipsToBounds = true
        field.layer.borderWidth = 1
        let borderColor = CustomColors.placeHolderColor
        field.layer.borderColor = borderColor.cgColor
        
        field.textColor = hexStringToUIColor(hex: "#231F20")
        field.font = .systemFont(ofSize: 14, weight: .semibold)
        
        return field
    }()
    
    lazy var rememberMeBox: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        
        button.layer.borderColor = CustomColors.placeHolderColor.cgColor
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        
        button.addTarget(self,
                         action: #selector(didTapRememberMe),
                         for: .touchUpInside)
        
        return button
    }()
    
    lazy var rememberMeButton: UIButton = {
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
    
    lazy var forgotPasswordButton: UIButton = {
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
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Enter", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        
        button.backgroundColor = hexStringToUIColor(hex: "#FFA300")
        
        button.layer.cornerRadius = 10
        button.layer.opacity = 0.5
        
        button.isEnabled = false
        button.addTarget(self,
                         action: #selector(didTapEnter),
                         for: .touchUpInside)
        return button
    }()
    
    lazy var footerButton: UIButton = {
        let button = UIButton()
        
       let title = getAttributedFooterLabelForRegistrationPage(basicText: "Don't have an account? ", coloredString: "Sign up")
        
        button.setAttributedTitle(title, for: .normal)
        
        button.addTarget(self,
                         action: #selector(didTapSignUp),
                         for: .touchUpInside)
        
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Parent Delegate
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    //MARK: - Functions
    
    @objc private func didTapSignUp() {
        delegate?.didTapSignUp()
    }
    
    private func enableEnterButton() {
        if emailTextField.text != "", passwordTextField.text != "" {
            enterButton.isEnabled = true
            enterButton.layer.opacity = 0
        }
    }
    
    private func setupUI () {
        backgroundColor = .white
        
        configureConstraints()
        
        let dismissKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        addGestureRecognizer(dismissKeyboardTap)
        
        passwordTextField.delegate = self
        emailTextField.delegate = self
    }
    
    func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        if let textRange = passwordTextField.textRange(from: passwordTextField.beginningOfDocument,
                                                       to: passwordTextField.endOfDocument) {
            passwordTextField.replace(textRange, withText: passwordTextField.text!)
        }
    }
    
    @objc func dismissKeyboard() {
        endEditing(true)
    }
    
    private func configureConstraints() {
        
//        addSubview(emailLabel)
//        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(rememberMeBox)
        addSubview(forgotPasswordButton)
        addSubview(rememberMeButton)
        addSubview(enterButton)
        addSubview(footerButton)
        addSubview(emailStackView)
        addSubview(passwordStackView)
        
        emailStackView.addArrangedSubview(emailLabel)
        emailStackView.addArrangedSubview(emailTextField)
        emailStackView.addArrangedSubview(wrongEmailAlertLabel)
        wrongEmailAlertLabel.isHidden = true
        
        passwordStackView.addArrangedSubview(passwordLabel)
        passwordStackView.addArrangedSubview(passwordTextField)
        passwordStackView.addArrangedSubview(wrongPasswordAlertLabel)
        wrongPasswordAlertLabel.isHidden = true
        
        emailStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
        }
        
        passwordStackView.snp.makeConstraints { make in
            make.top.equalTo(emailStackView.snp.bottom).offset(23)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
        }
        
        emailLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(28)
//            make.left.equalToSuperview().offset(25)
//            make.width.equalTo(40)
        }

        emailTextField.snp.makeConstraints { make in
//            make.left.equalToSuperview().offset(25)
//            make.right.equalToSuperview().offset(-25)
//            make.top.equalTo(emailLabel.snp.bottom).offset(12)
            make.height.equalTo(50)
            make.width.equalTo(emailStackView.snp.width)
        }
        
        passwordLabel.snp.makeConstraints { make in
//            make.left.equalToSuperview().offset(25)
//            make.top.equalTo(emailStackView.snp.bottom).offset(23)
//            make.width.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints { make in
//            make.left.equalToSuperview().offset(25)
//            make.right.equalToSuperview().offset(-25)
//            make.top.equalTo(passwordLabel.snp.bottom).offset(12)
//            make.height.equalTo(50)
            make.height.equalTo(50)
            make.width.equalTo(emailStackView.snp.width)
        }
        
        rememberMeBox.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.top.equalTo(passwordStackView.snp.bottom).offset(14)
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
        
        enterButton.snp.makeConstraints { make in
            make.top.equalTo(rememberMeButton.snp.bottom).offset(48)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(49)
        }
        
        footerButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func didTapView() {
        
    }
    
    @objc private func didTapRememberMe() {
        if isRememberMe {
            rememberMeBox.backgroundColor = hexStringToUIColor(hex: "#00D68F")
            rememberMeBox.setImage(UIImage(named: "ic_tick"), for: .normal)
            isRememberMe = false
        } else {
            rememberMeBox.backgroundColor = .white
            isRememberMe = true
        }
    }
    
    @objc private func didTapForgotPassword() {
        delegate?.didTapEnter()
    }
    
    @objc private func didTapEnter() {
        delegate?.didTapEnter()
    }
}


