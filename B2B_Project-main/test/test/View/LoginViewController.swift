//
//  LoginViewController.swift
//  test
//
//  Created by USER11 on 8/16/22.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController, LoginViewDelegate {
    
    //MARK: - Variables
    
    let loginView = LoginView()
    
    let signInView = SignUpView()
    
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
    }
    
    //MARK: - Functions
    
    func didTapSignUp() {
        loginView.removeFromSuperview()
        fillContainer(subView: signInView)
    }
    
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
            make.top.equalTo(safeLayoutGuide.snp.top).offset(48)
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
            make.top.equalTo(loginToYourAccountLabel.snp.bottom).offset(32)
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
            fillContainer(subView: loginView)
            loginButton.setTitleColor(CustomColors.selectedButtonColor, for: .normal)
            signUpButton.setTitleColor(CustomColors.unselectedButtonColor, for: .normal)
            
            selectedButtonUnderline.removeFromSuperview()
            
            view.addSubview(selectedButtonUnderline)
            
            let width = loginButton.frame.size.width + 120
            selectedButtonUnderline.snp.makeConstraints { make in
                make.width.equalTo(width)
                make.centerX.equalTo(loginButton.snp.centerX)
                make.centerY.equalTo(generalUnderline.snp.centerY)
                make.height.equalTo(2)
            }
            
        case 2:
            fillContainer(subView: signInView)
            signUpButton.setTitleColor(CustomColors.selectedButtonColor, for: .normal)
            loginButton.setTitleColor(CustomColors.unselectedButtonColor, for: .normal)
            
            selectedButtonUnderline.removeFromSuperview()
            
            view.addSubview(selectedButtonUnderline)
            
            let width = signUpButton.frame.size.width + 120
            selectedButtonUnderline.snp.makeConstraints { make in
                make.width.equalTo(width)
                make.centerX.equalTo(signUpButton.snp.centerX)
                make.centerY.equalTo(generalUnderline.snp.centerY)
                make.height.equalTo(2)
            }
            
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
}
