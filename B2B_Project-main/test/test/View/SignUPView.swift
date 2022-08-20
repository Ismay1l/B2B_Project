//
//  SignIpView.swift
//  test
//
//  Created by USER11 on 8/16/22.
//

import UIKit
import iOSDropDown

class SignUpView: UIView {
    
    //MARK: - Variables
    
    let vm = LoginViewVM()
    
    //MARK: - UI Elements
    
    let dropDown = DropDown()
    
    private lazy var generalScrollView: UIScrollView = {
        let view = UIScrollView()
        view.bounces = true
        view.alwaysBounceVertical = true
        view.isScrollEnabled = true
        view.scrollsToTop = true
        view.indicatorStyle = .default
        view.showsVerticalScrollIndicator = true
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var nameLastnameLabel = getLabel(text: "Name, Last name",
                                                  size: 14,
                                                  weigth: .regular,
                                                  color: "#231F20")
    
    private lazy var emailLabel = getLabel(text: "Email(corporative)",
                                           size: 14,
                                           weigth: .regular,
                                           color: "231F20")
    
    private lazy var companyNameLabel = getLabel(text: "Company name",
                                                 size: 14,
                                                 weigth: .regular,
                                                 color: "231F20")
    
    private lazy var categoryLabel = getLabel(text: "Category",
                                             size: 14,
                                             weigth: .regular,
                                             color: "231F20")
    
    private lazy var telephoneLabel = getLabel(text: "Telephone",
                                               size: 14,
                                               weigth: .regular,
                                               color: "231F20")
    
    private lazy var addressLabel = getLabel(text: "Address (optional)",
                                             size: 14,
                                             weigth: .regular,
                                             color: "231F20")
    
    lazy var nameLastnameTextField: SignUpTextField = {
        let field = SignUpTextField()
        let color = hexStringToUIColor(hex: "#D0D0CE")
        field.attributedPlaceholder = NSAttributedString(
            string: "Name Lastname",
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
    
    lazy var emailTextField: EmailTextField = {
        let field = EmailTextField()
        let color = hexStringToUIColor(hex: "#D0D0CE")
        field.attributedPlaceholder = NSAttributedString(
            string: "example@expressbank.az",
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
    
    lazy var companyNameTextField: SignUpTextField = {
        let field = SignUpTextField()
        let color = hexStringToUIColor(hex: "#D0D0CE")
        field.attributedPlaceholder = NSAttributedString(
            string: "Express bank",
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
    
    lazy var telephoneTextField: SignUpTextField = {
        let field = SignUpTextField()
        let color = hexStringToUIColor(hex: "#D0D0CE")
        field.attributedPlaceholder = NSAttributedString(
            string: "55 555 55 55",
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
    
    lazy var addressTextField: SignUpTextField = {
        let field = SignUpTextField()
        let color = hexStringToUIColor(hex: "#D0D0CE")
        field.attributedPlaceholder = NSAttributedString(
            string: "Write company location",
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
    
    
    required init?(coder: NSCoder) {
            fatalError()
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.setupUI()
        }
        
    private func setupUI () {
        backgroundColor = .white
        
        addSubview(generalScrollView)
        generalScrollView.addSubview(nameLastnameLabel)
        generalScrollView.addSubview(nameLastnameTextField)
        generalScrollView.addSubview(emailLabel)
        generalScrollView.addSubview(emailTextField)
        generalScrollView.addSubview(companyNameLabel)
        generalScrollView.addSubview(companyNameTextField)
        generalScrollView.addSubview(categoryLabel)
        generalScrollView.addSubview(dropDown)
        generalScrollView.addSubview(telephoneLabel)
        generalScrollView.addSubview(telephoneTextField)
        generalScrollView.addSubview(addressLabel)
        generalScrollView.addSubview(addressTextField)
        
        generalScrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
        
        nameLastnameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(27)
            make.top.equalToSuperview().offset(28)
        }
        
        nameLastnameTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.top.equalTo(nameLastnameLabel.snp.bottom).offset(8)
            make.right.equalTo(self.snp.right).offset(-25)
            make.height.equalTo(48)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(27)
            make.top.equalTo(nameLastnameTextField.snp.bottom).offset(33)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.right.equalTo(self.snp.right).offset(-25)
            make.height.equalTo(48)
            make.top.equalTo(emailLabel.snp.bottom).offset(8)
        }
        
        companyNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(27)
            make.top.equalTo(emailTextField.snp.bottom).offset(33)
        }
        
        companyNameTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.right.equalTo(self.snp.right).offset(-25)
            make.height.equalTo(48)
            make.top.equalTo(companyNameLabel.snp.bottom).offset(8)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(27)
            make.top.equalTo(companyNameTextField.snp.bottom).offset(33)
        }
        
        dropDown.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.right.equalTo(self.snp.right).offset(-25)
            make.height.equalTo(48)
            make.top.equalTo(categoryLabel.snp.bottom).offset(8)
        }
        
        telephoneLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(27)
            make.top.equalTo(dropDown.snp.bottom).offset(33)
        }
        
        telephoneTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.right.equalTo(self.snp.right).offset(-25)
            make.height.equalTo(48)
            make.top.equalTo(telephoneLabel.snp.bottom).offset(8)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(27)
            make.top.equalTo(telephoneTextField.snp.bottom).offset(33)
        }
        
        addressTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.right.equalTo(self.snp.right).offset(-25)
            make.height.equalTo(48)
            make.top.equalTo(addressLabel.snp.bottom).offset(8)
        }
        
        dropDown.text = "Choose category"
        dropDown.optionArray = vm.categories
        dropDown.textColor = hexStringToUIColor(hex: "#D0D0CE")
        dropDown.borderWidth = 1
        dropDown.borderColor = hexStringToUIColor(hex: "#D0D0CE")
        dropDown.font = .systemFont(ofSize: 14, weight: .regular)
        dropDown.backgroundColor = .clear
        dropDown.rowBackgroundColor = hexStringToUIColor(hex: "e5e5e5")
        dropDown.selectedRowColor = .systemGray
        dropDown.textAlignment = .left
        dropDown.cornerRadius = 10
        dropDown.isSearchEnable = false
    }
}
