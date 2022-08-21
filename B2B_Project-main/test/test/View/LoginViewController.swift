//
//  LoginViewController.swift
//  test
//
//  Created by USER11 on 8/16/22.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    //MARK: - Variables
    
    let loginView = LoginView()
    
    let signUpView = SignUpView()
    
    let successView = SuccessView()
    
    //MARK: - UIElements
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        
        let attrstr1 = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32), NSAttributedString.Key.foregroundColor: UIColor.black]
        let attrstr2 = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30, weight: .medium), NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let attributedString1 = NSMutableAttributedString(string:"B2B", attributes: attrstr1)
        
        let attributedString2 = NSMutableAttributedString(string:"by", attributes: attrstr2)
        let attstr3 = NSMutableAttributedString(string: "  ")
        
        attributedString1.append(attstr3)
        attributedString1.append(attributedString2)
        
        label.attributedText = attributedString1
        
        return label
    }()
    
    private lazy var headerLabelExpress: UILabel = {
        let label = UILabel()
        
        label.text = "Express24"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        
        label.textColor = .systemOrange
        
        return label
    }()
    
    private lazy var signUpHeaderLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Sign Up"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        
        label.textColor = CustomColors.unselectedButtonColor
        
        return label
    }()
    
    private lazy var loginToYourAccountLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Login to your account"
        label.textColor = CustomColors.unselectedButtonColor
        
        label.font = .systemFont(ofSize: 24, weight: .medium)
        
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Login", for: .normal)
        button.setTitleColor(CustomColors.selectedButtonColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        
        button.addTarget(self,
                         action: #selector(didTapButton),
                         for: .touchUpInside)
        button.tag = 1
        
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(CustomColors.unselectedButtonColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        
        button.addTarget(self,
                         action: #selector(didTapButton),
                         for: .touchUpInside)
        button.tag = 2
        
        return button
    }()
    
    private lazy var generalUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = CustomColors.generalUnderlineColor
        return view
    }()
    
    private lazy var selectedButtonUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = CustomColors.selectedButtonColor
        return view
    }()
    
    private lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    //MARK: - Parent Delegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        fillContainer(subView: loginView)
        
        configureConstraints()
        
        loginView.delegate = self
        signUpView.delegate = self
        successView.delegate = self
    }
    
    //MARK: - Functions
    
    private func configureConstraints() {
        view.addSubview(headerLabelExpress)
        view.addSubview(headerLabel)
        view.addSubview(loginToYourAccountLabel)
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        view.addSubview(containerView)
        view.addSubview(generalUnderline)
        
        let safeLayoutGuide = view.safeAreaLayoutGuide
        
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalTo(safeLayoutGuide.snp.centerX)
            make.top.equalTo(safeLayoutGuide.snp.top).offset(40)
        }
        
        headerLabelExpress.snp.makeConstraints { make in
            make.centerX.equalTo(safeLayoutGuide.snp.centerX)
            make.top.equalTo(headerLabel.snp.bottom).offset(-10)
        }
        
        loginToYourAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabelExpress.snp.bottom).offset(24)
            make.centerX.equalTo(safeLayoutGuide.snp.centerX)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(loginToYourAccountLabel.snp.bottom).offset(32)
            make.left.equalTo(safeLayoutGuide.snp.left).offset(72)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.top)
            make.right.equalTo(safeLayoutGuide.snp.right).offset(-63)
        }
        
        generalUnderline.snp.makeConstraints { make in
            make.left.equalTo(safeLayoutGuide.snp.left)
            make.right.equalTo(safeLayoutGuide.snp.right)
            make.height.equalTo(2)
            make.top.equalTo(loginButton.snp.bottom).offset(10)
        }
        
        view.addSubview(selectedButtonUnderline)
        
        let width = loginButton.frame.size.width + 120
        selectedButtonUnderline.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.centerX.equalTo(loginButton.snp.centerX)
            make.centerY.equalTo(generalUnderline.snp.centerY)
            make.height.equalTo(2)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(generalUnderline.snp.bottom)
            make.left.equalTo(safeLayoutGuide.snp.left)
            make.right.equalTo(safeLayoutGuide.snp.right)
            make.bottom.equalTo(safeLayoutGuide.snp.bottom)
        }
    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            switchToLoginView()
        case 2:
            switchToSignUpView()
            
        default:
            fillContainer(subView: loginView)
        }
    }
    
    private func fillContainer ( subView: UIView) {
        
        self.containerView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
        
        self.containerView.addSubview(subView)
        
        subView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    func switchToSignUpView() {
        
        fillContainer(subView: signUpView)
        signUpButton.setTitleColor(CustomColors.selectedButtonColor, for: .normal)
        loginButton.setTitleColor(CustomColors.unselectedButtonColor, for: .normal)
        
        selectedButtonUnderline.removeFromSuperview()
        headerLabel.removeFromSuperview()
        headerLabelExpress.removeFromSuperview()
        loginToYourAccountLabel.removeFromSuperview()
        
        let safeLayoutGuide = view.safeAreaLayoutGuide
        
        view.addSubview(signUpHeaderLabel)
        
        signUpHeaderLabel.snp.makeConstraints { make in
            make.centerX.equalTo(safeLayoutGuide.snp.centerX)
            make.top.equalTo(safeLayoutGuide.snp.top).offset(30)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(signUpHeaderLabel.snp.bottom).offset(29)
            make.left.equalTo(safeLayoutGuide.snp.left).offset(72)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.top)
            make.right.equalTo(safeLayoutGuide.snp.right).offset(-63)
        }
        
        view.addSubview(selectedButtonUnderline)
        
        let width = signUpButton.frame.size.width + 120
        selectedButtonUnderline.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.centerX.equalTo(signUpButton.snp.centerX)
            make.centerY.equalTo(generalUnderline.snp.centerY)
            make.height.equalTo(2)
        }
    }
    
    func switchToLoginView() {
        
        fillContainer(subView: loginView)
        loginButton.setTitleColor(CustomColors.selectedButtonColor, for: .normal)
        signUpButton.setTitleColor(CustomColors.unselectedButtonColor, for: .normal)
        
        selectedButtonUnderline.removeFromSuperview()
        signUpHeaderLabel.removeFromSuperview()
        
        view.addSubview(headerLabel)
        view.addSubview(headerLabelExpress)
        view.addSubview(loginToYourAccountLabel)
        
        let safeLayoutGuide = view.safeAreaLayoutGuide
        
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalTo(safeLayoutGuide.snp.centerX)
            make.top.equalTo(safeLayoutGuide.snp.top).offset(40)
        }
        
        headerLabelExpress.snp.makeConstraints { make in
            make.centerX.equalTo(safeLayoutGuide.snp.centerX)
            make.top.equalTo(headerLabel.snp.bottom).offset(-10)
        }
        
        loginToYourAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabelExpress.snp.bottom).offset(24)
            make.centerX.equalTo(safeLayoutGuide.snp.centerX)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(loginToYourAccountLabel.snp.bottom).offset(32)
            make.left.equalTo(safeLayoutGuide.snp.left).offset(72)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.top)
            make.right.equalTo(safeLayoutGuide.snp.right).offset(-63)
        }
        
        view.addSubview(selectedButtonUnderline)
        
        let width = loginButton.frame.size.width + 120
        selectedButtonUnderline.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.centerX.equalTo(loginButton.snp.centerX)
            make.centerY.equalTo(generalUnderline.snp.centerY)
            make.height.equalTo(2)
        }
    }
    
    func switchToSuccessView() {
        
        signUpView.removeFromSuperview()
        signUpHeaderLabel.removeFromSuperview()
        signUpButton.removeFromSuperview()
        loginButton.removeFromSuperview()
        generalUnderline.removeFromSuperview()
        selectedButtonUnderline.removeFromSuperview()
        
        view.addSubview(successView)
        
        successView.layer.cornerRadius = 10
        successView.layer.shadowOffset = CGSize(width: -1, height: 1)
        successView.layer.shadowRadius = 20
        successView.layer.shadowOpacity = 0.5
        successView.layer.shadowColor = UIColor.black.cgColor
        
        let width = view.frame.size.width - 80
        
        successView.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(42)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-42)
            make.height.equalTo(340)
            make.width.equalTo(width)
            make.center.equalTo(view.safeAreaLayoutGuide.snp.center)
        }
    }
    
    func switchToMainPage() {
        successView.removeFromSuperview()
        configureConstraints()
        fillContainer(subView: loginView)
        
        loginButton.setTitleColor(CustomColors.selectedButtonColor, for: .normal)
        signUpButton.setTitleColor(CustomColors.unselectedButtonColor, for: .normal)
    }
    
}
