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
    
    let vm = RegistrationVM()
    
    var delegate: SignUpViewDelegate?
    
    var isDropDownTapped = true
    
    //MARK: - UI Elements
    
    lazy var categoryDropDownButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.textAlignment = .right
        button.titleLabel?.textColor = hexStringToUIColor(hex: "231F20")
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        let borderColor = CustomColors.placeHolderColor
        button.layer.borderColor = borderColor.cgColor
        button.addTarget(self,
                         action: #selector(didTapDropDown),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var categoryDropDownTable: UITableView = {
        let view = UITableView()
        
        view.isHidden = true
        view.backgroundColor = .clear
        
        view.delegate = self
        view.dataSource = self
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return view
    }()
    
    private lazy var nameLastnameStackView = getStackView()
    
    private lazy var emailStackView = getStackView()
    
    private lazy var companyNameStackView = getStackView()
    
    private lazy var categoryStackView = getStackView()
    
    private lazy var telephoneStackView = getStackView()
    
    lazy var wrongNameLastnameAlertLabel = getLabel(text: "Caption text, description, error notification",
                                                        size: 12, weigth: .regular,
                                                        color: "FF3D71")
    
    lazy var wrongEmailAlertLabel = getLabel(text: "Caption text, description, error notification",
                                                        size: 12, weigth: .regular,
                                                        color: "FF3D71")
    
    lazy var wrongCompanyNameAlertLabel = getLabel(text: "Caption text, description, error notification",
                                                        size: 12, weigth: .regular,
                                                        color: "FF3D71")
    
    lazy var wrongCategoryAlertLabel = getLabel(text: "Caption text, description, error notification",
                                                        size: 12, weigth: .regular,
                                                        color: "FF3D71")
    
    lazy var wrongTelephoneAlertLabel = getLabel(text: "Caption text, description, error notification",
                                                        size: 12, weigth: .regular,
                                                        color: "FF3D71")
    
//    let dropDown = DropDown()
    
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
    
    private lazy var websiteLabel = getLabel(text: "Website link (optional)",
                                             size: 14,
                                             weigth: .regular,
                                             color: "231F20")
    
    lazy var nameLastnameTextField = getSignUpTextField(text: "Name Lastname")
    
    lazy var emailTextField = getEmailTextField()
    
    lazy var companyNameTextField = getSignUpTextField(text: "Express bank")
    
    lazy var telephoneTextField = getSignUpTextField(text: "55 555 55 55")
    
    lazy var addressTextField = getSignUpTextField(text: "Write company location")
    
    lazy var websiteTextField = getSignUpTextField(text: "www.expressbank.az")
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        
        button.backgroundColor = hexStringToUIColor(hex: "#FFA300")
        
        button.layer.cornerRadius = 10
        button.layer.opacity = 0.5
        
        button.isEnabled = false
        button.addTarget(self,
                         action: #selector(didTapNext),
                         for: .touchUpInside)
        return button
    }()
    
    lazy var footerButton: UIButton = {
        let button = UIButton()
        
        let title = getAttributedFooterLabelForRegistrationPage(basicText: "Already have an account? ", coloredString: "Login")
         
         button.setAttributedTitle(title, for: .normal)
        
        button.addTarget(self,
                         action: #selector(didTapLogin),
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
        
    private func setupUI () {
        
        backgroundColor = .white
        
        configureConstraints()
        
        let dismissKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        addGestureRecognizer(dismissKeyboardTap)
        
        nameLastnameTextField.delegate = self
        emailTextField.delegate = self
        companyNameTextField.delegate = self
        telephoneTextField.delegate = self
    }
    
    private func configureConstraints () {
        
        addSubview(generalScrollView)
        generalScrollView.addSubview(addressLabel)
        generalScrollView.addSubview(addressTextField)
        generalScrollView.addSubview(websiteLabel)
        generalScrollView.addSubview(websiteTextField)
        generalScrollView.addSubview(nextButton)
        generalScrollView.addSubview(footerButton)
        
        generalScrollView.addSubview(nameLastnameStackView)
        generalScrollView.addSubview(emailStackView)
        generalScrollView.addSubview(companyNameStackView)
        generalScrollView.addSubview(categoryStackView)
        generalScrollView.addSubview(telephoneStackView)
        
        nameLastnameStackView.addArrangedSubview(nameLastnameLabel)
        nameLastnameStackView.addArrangedSubview(nameLastnameTextField)
        nameLastnameStackView.addArrangedSubview(wrongNameLastnameAlertLabel)
        wrongNameLastnameAlertLabel.isHidden = true
        
        emailStackView.addArrangedSubview(emailLabel)
        emailStackView.addArrangedSubview(emailTextField)
        emailStackView.addArrangedSubview(wrongEmailAlertLabel)
        wrongEmailAlertLabel.isHidden = true
        
        companyNameStackView.addArrangedSubview(companyNameLabel)
        companyNameStackView.addArrangedSubview(companyNameTextField)
        companyNameStackView.addArrangedSubview(wrongCompanyNameAlertLabel)
        wrongCompanyNameAlertLabel.isHidden = true
        
        categoryStackView.addArrangedSubview(categoryLabel)
        categoryStackView.addArrangedSubview(categoryDropDownButton)
//        categoryStackView.addArrangedSubview(dropDown)
        categoryStackView.addArrangedSubview(wrongCategoryAlertLabel)
        wrongCategoryAlertLabel.isHidden = true
        
        telephoneStackView.addArrangedSubview(telephoneLabel)
        telephoneStackView.addArrangedSubview(telephoneTextField)
        telephoneStackView.addArrangedSubview(wrongTelephoneAlertLabel)
        wrongTelephoneAlertLabel.isHidden = true
        
        let left = generalScrollView.contentLayoutGuide.snp.left
        let right = self.snp.right
        let top = generalScrollView.contentLayoutGuide.snp.top
        let bottom = generalScrollView.contentLayoutGuide.snp.bottom
        
        generalScrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
        
        nameLastnameStackView.snp.makeConstraints { make in
            make.top.equalTo(top).offset(28)
            make.left.equalTo(left).offset(25)
            make.right.equalTo(right).offset(-25)
        }

        nameLastnameTextField.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalTo(nameLastnameStackView.snp.width)
        }
        
        emailStackView.snp.makeConstraints { make in
            make.top.equalTo(nameLastnameStackView.snp.bottom).offset(33)
            make.left.equalTo(left).offset(25)
            make.right.equalTo(right).offset(-25)
        }

        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalTo(emailStackView.snp.width)
        }
        
        companyNameStackView.snp.makeConstraints { make in
            make.top.equalTo(emailStackView.snp.bottom).offset(33)
            make.left.equalTo(left).offset(25)
            make.right.equalTo(right).offset(-25)
        }

        companyNameTextField.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalTo(companyNameStackView.snp.width)
        }
        
        categoryStackView.snp.makeConstraints { make in
            make.top.equalTo(companyNameStackView.snp.bottom).offset(33)
            make.left.equalTo(left).offset(25)
            make.right.equalTo(right).offset(-25)
        }
        
        categoryDropDownButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalTo(companyNameStackView.snp.width)
        }

//        dropDown.snp.makeConstraints { make in
//            make.height.equalTo(48)
//            make.width.equalTo(categoryStackView.snp.width)
//        }
        
        telephoneStackView.snp.makeConstraints { make in
            make.top.equalTo(categoryStackView.snp.bottom).offset(33)
            make.left.equalTo(left).offset(25)
            make.right.equalTo(right).offset(-25)
        }

        telephoneTextField.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalTo(telephoneStackView.snp.width)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.left.equalTo(left).offset(27)
            make.top.equalTo(telephoneStackView.snp.bottom).offset(33)
        }

        addressTextField.snp.makeConstraints { make in
            make.left.equalTo(left).offset(25)
            make.right.equalTo(right).offset(-25)
            make.height.equalTo(48)
            make.top.equalTo(addressLabel.snp.bottom).offset(8)
        }

        websiteLabel.snp.makeConstraints { make in
            make.left.equalTo(left).offset(27)
            make.top.equalTo(addressTextField.snp.bottom).offset(33)
        }

        websiteTextField.snp.makeConstraints { make in
            make.left.equalTo(left).offset(25)
            make.right.equalTo(right).offset(-25)
            make.height.equalTo(48)
            make.top.equalTo(websiteLabel.snp.bottom).offset(8)
        }

        nextButton.snp.makeConstraints { make in
            make.top.equalTo(websiteTextField.snp.bottom).offset(32)
            make.left.equalTo(left).offset(25)
            make.right.equalTo(right).offset(-25)
            make.height.equalTo(49)
        }

        footerButton.snp.makeConstraints { make in
            make.top.equalTo(nextButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bottom).offset(-10)
        }

//        dropDown.text = "Choose category"
//        dropDown.optionArray = vm.categories
//        dropDown.textColor = hexStringToUIColor(hex: "#D0D0CE")
//        dropDown.borderWidth = 1
//        dropDown.borderColor = hexStringToUIColor(hex: "#D0D0CE")
//        dropDown.font = .systemFont(ofSize: 14, weight: .regular)
//        dropDown.backgroundColor = .clear
//        dropDown.rowBackgroundColor = hexStringToUIColor(hex: "e5e5e5")
//        dropDown.selectedRowColor = .systemGray
//        dropDown.textAlignment = .left
//        dropDown.cornerRadius = 10
//        dropDown.isSearchEnable = false
    }
    
    
    @objc private func didTapNext() {
        delegate?.didTapNext()
    }
    
    @objc func dismissKeyboard() {
        endEditing(true)
    }
    
    @objc private func didTapLogin() {
        delegate?.didTapLogin()
    }
    
    @objc private func didTapDropDown() {
        
        if isDropDownTapped {
            categoryDropDownTable.isHidden = false
            
            categoryStackView.addArrangedSubview(categoryDropDownTable)
            
            categoryDropDownTable.snp.makeConstraints { make in
                make.top.equalTo(categoryDropDownButton.snp.bottom).offset(2)
                make.width.equalTo(companyNameStackView.snp.width)
                make.height.equalTo(100)
            }
            isDropDownTapped = false
        }else {
            categoryDropDownTable.removeFromSuperview()
            isDropDownTapped = true
        }
    }
}
