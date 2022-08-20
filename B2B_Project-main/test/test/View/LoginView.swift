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
    
    var isPasswordHidden = true
    
    var delegate: LoginViewDelegate?
    
    //MARK: - UI Elements
    
    lazy var wrongEmailAlertLabel: UILabel = {
        let label = UILabel()
        label.text = "Caption text, description, error notification"
        label.textColor = hexStringToUIColor(hex: "#FF3D71")
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    lazy var correctTickIcon: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "ic_correct") , for: .normal)
        button.frame = CGRect(x:0, y:0, width:30, height:30)
        return button
    }()
    
    private lazy var emailLabel = getLabel(text: "Email",
                                           size: 14,
                                           weigth: .regular,
                                           color: "#231F20")
    
    lazy var passwordLabel = getLabel(text: "Password",
                                              size: 14,
                                              weigth: .regular,
                                              color: "#231F20")
    
    lazy var emailTextField: EmailTextField = {
        let field = EmailTextField()
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
    
    lazy var passwordTextField: PasswordTextField = {
        let field = PasswordTextField()
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
        
        return field
    }()
    
    lazy var rememberMeBox: UIButton = {
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
    
     lazy var footerLabel: UILabel = {
        let label = UILabel()
        
        let attrstr1 = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let attrstr2 = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.foregroundColor: hexStringToUIColor(hex: "#FFB500")]
        
        let attributedString1 = NSMutableAttributedString(string:"Don’t have an account?", attributes: attrstr1)
        
        let attributedString2 = NSMutableAttributedString(string:" Sign up", attributes: attrstr2)
        
        attributedString1.append(attributedString2)
        
        label.attributedText = attributedString1
        
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
        
        let tap = UITapGestureRecognizer(target: self,
                                          action: #selector(didTapSignUp))
         
        footerLabel.addGestureRecognizer(tap)
    }
    
    //MARK: - Functions
    
    @objc private func didTapSignUp() {
        delegate?.didTapSignUP()
    }
    
    private func enableEnterButton() {
        if emailTextField.text != "", passwordTextField.text != "" {
            enterButton.isEnabled = true
            enterButton.layer.opacity = 0
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
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
        
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(rememberMeBox)
        addSubview(forgotPasswordButton)
        addSubview(rememberMeButton)
        addSubview(enterButton)
        addSubview(footerLabel)
        
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
        
        enterButton.snp.makeConstraints { make in
            make.top.equalTo(rememberMeButton.snp.bottom).offset(48)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(49)
        }
        
        footerLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-48)
            make.left.equalToSuperview().offset(90)
            make.right.equalToSuperview().offset(-90)
            make.top.equalTo(enterButton.snp.bottom).offset(125)
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
        print("Forgot password")
    }
    
    @objc private func didTapEnter() {
        print("Enter tapped")
    }
}


