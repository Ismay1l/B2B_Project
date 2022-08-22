//
//  LoginViewController.swift
//  test
//
//  Created by USER11 on 8/16/22.
//

import UIKit
import SnapKit
import Segmentio

class LoginViewController: UIViewController {
    
    //MARK: - Variables
    
    let loginView = LoginView()
    
    let signUpView = SignUpView()
    
    let successView = SuccessVC()
    
    var segmentController = Segmentio()
    
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
    
    private lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    //MARK: - Parent Delegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        fillContainer(subView: loginView)
        
        configureConstraints()
        segmentSetup()
        
        loginView.delegate = self
        signUpView.delegate = self
        successView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        segmentDidChanged(segmentIndex: segmentController.selectedSegmentioIndex)
        segmentController.selectedSegmentioIndex = 0
        
        loginView.emailTextField.text = nil
        loginView.passwordTextField.text = nil
        
        signUpView.nameLastnameTextField.text = nil
        signUpView.emailTextField.text = nil
        signUpView.companyNameTextField.text = nil
        signUpView.dropDown.selectedIndex = nil
        signUpView.telephoneTextField.text = nil
        signUpView.addressTextField.text = nil
        signUpView.websiteTextField.text = nil
    }
    
    //MARK: - Functions
    
    private func configureConstraints() {
        view.addSubview(headerLabelExpress)
        view.addSubview(headerLabel)
        view.addSubview(loginToYourAccountLabel)
        view.addSubview(containerView)
        view.addSubview(segmentController)
        
        let safeLayoutGuide = view.safeAreaLayoutGuide
        
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalTo(safeLayoutGuide.snp.centerX)
            make.top.equalTo(safeLayoutGuide.snp.top).offset(0)
        }
        
        headerLabelExpress.snp.makeConstraints { make in
            make.centerX.equalTo(safeLayoutGuide.snp.centerX)
            make.top.equalTo(headerLabel.snp.bottom).offset(-10)
        }
        
        loginToYourAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabelExpress.snp.bottom).offset(24)
            make.centerX.equalTo(safeLayoutGuide.snp.centerX)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(segmentController.snp.bottom)
            make.left.equalTo(safeLayoutGuide.snp.left)
            make.right.equalTo(safeLayoutGuide.snp.right)
            make.bottom.equalTo(safeLayoutGuide.snp.bottom)
        }
        
        segmentController.snp.makeConstraints { make in
            make.top.equalTo(loginToYourAccountLabel.snp.bottom).offset(32)
            make.height.equalTo(40)
            make.left.equalTo(safeLayoutGuide.snp.left)
            make.right.equalTo(safeLayoutGuide.snp.right)
        }
    }
    
    func segmentSetup() {
        
        segmentController.valueDidChange = { segmentio, segmentionIndex in
            self.segmentDidChanged(segmentIndex: segmentionIndex)
        }
        
        let states = SegmentioStates(
            defaultState: SegmentioState(
                backgroundColor: .clear,
                titleFont: UIFont.systemFont(ofSize: 16, weight: .medium),
                titleTextColor: CustomColors.unselectedButtonColor
            ),
            selectedState: SegmentioState(
                backgroundColor: .clear,
                titleFont: UIFont.systemFont(ofSize: 16, weight: .bold),
                titleTextColor: CustomColors.selectedButtonColor
            ),
            highlightedState: SegmentioState(
                backgroundColor: .clear,
                titleFont: UIFont.systemFont(ofSize: 16),
                titleTextColor: UIColor.clear
            )
        )
        
        var content = [SegmentioItem]()
        
        let item1 = SegmentioItem(title: "Login", image: UIImage.init(named: "apple"))
        let item2 = SegmentioItem(title: "Sign up", image: UIImage.init(named: "apple"))
        
        content.append(item1)
        content.append(item2)
        
        let horizontalSeparatorOptions = SegmentioHorizontalSeparatorOptions( type: SegmentioHorizontalSeparatorType.bottom, height: 0, color: .clear)
        
        let indicatorOptions = SegmentioIndicatorOptions(type: .bottom,
                                                         ratio: 1,
                                                         height: 2,
                                                         color: hexStringToUIColor(hex: "#FFB500"))
        
        let options = SegmentioOptions(backgroundColor: .clear,
                                       segmentPosition: SegmentioPosition.dynamic,
                                       scrollEnabled: false,
                                       indicatorOptions: indicatorOptions,
                                       horizontalSeparatorOptions: horizontalSeparatorOptions,
                                       verticalSeparatorOptions: nil,
                                       imageContentMode: .bottom,
                                       labelTextAlignment: .center,
                                       labelTextNumberOfLines: 1,
                                       segmentStates: states,
                                       animationDuration: 0)
        
        segmentController.setup(content: content, style: SegmentioStyle.onlyLabel, options: options)
        segmentController.selectedSegmentioIndex = 0
    }
    
    func segmentDidChanged(segmentIndex: Int) {
        switch segmentIndex {
        case 0:
            switchToLoginView()
        case 1:
            switchToSignUpView()
        default:
            break
        }
    }
    
    private func fillContainer ( subView: UIView) {
        
        containerView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
        
        containerView.addSubview(subView)
        
        subView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    func switchToSignUpView() {
        
        self.title = "Sign Up"
        
        fillContainer(subView: signUpView)
        
        headerLabel.removeFromSuperview()
        headerLabelExpress.removeFromSuperview()
        loginToYourAccountLabel.removeFromSuperview()
        
        let safeLayoutGuide = view.safeAreaLayoutGuide
        
        segmentController.snp.makeConstraints { make in
            make.top.equalTo(safeLayoutGuide.snp.top).offset(10)
            make.height.equalTo(40)
            make.left.equalTo(safeLayoutGuide.snp.left)
            make.right.equalTo(safeLayoutGuide.snp.right)
        }
    }

    func switchToLoginView() {
        
        fillContainer(subView: loginView)
        
        self.title = nil
        
        segmentController.removeFromSuperview()
        
        view.addSubview(headerLabel)
        view.addSubview(headerLabelExpress)
        view.addSubview(loginToYourAccountLabel)
        view.addSubview(segmentController)
        
        let safeLayoutGuide = view.safeAreaLayoutGuide
        
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalTo(safeLayoutGuide.snp.centerX)
            make.top.equalTo(safeLayoutGuide.snp.top).offset(0)
        }
        
        headerLabelExpress.snp.makeConstraints { make in
            make.centerX.equalTo(safeLayoutGuide.snp.centerX)
            make.top.equalTo(headerLabel.snp.bottom).offset(-10)
        }
        
        loginToYourAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabelExpress.snp.bottom).offset(24)
            make.centerX.equalTo(safeLayoutGuide.snp.centerX)
        }
        
        segmentController.snp.makeConstraints { make in
            make.top.equalTo(loginToYourAccountLabel.snp.bottom).offset(32)
            make.height.equalTo(40)
            make.left.equalTo(safeLayoutGuide.snp.left)
            make.right.equalTo(safeLayoutGuide.snp.right)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(segmentController.snp.bottom)
            make.left.equalTo(safeLayoutGuide.snp.left)
            make.right.equalTo(safeLayoutGuide.snp.right)
            make.bottom.equalTo(safeLayoutGuide.snp.bottom)
        }
    }

//    func switchToSuccessView() {
//
//        signUpView.removeFromSuperview()
//        signUpHeaderLabel.removeFromSuperview()
//        signUpButton.removeFromSuperview()
//        loginButton.removeFromSuperview()
//        generalUnderline.removeFromSuperview()
//        selectedButtonUnderline.removeFromSuperview()
//
//        view.addSubview(successView)
//
//        successView.layer.cornerRadius = 10
//        successView.layer.shadowOffset = CGSize(width: -1, height: 1)
//        successView.layer.shadowRadius = 20
//        successView.layer.shadowOpacity = 0.5
//        successView.layer.shadowColor = UIColor.black.cgColor
//
//        let width = view.frame.size.width - 80
//
//        successView.snp.makeConstraints { make in
//            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(42)
//            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-42)
//            make.height.equalTo(340)
//            make.width.equalTo(width)
//            make.center.equalTo(view.safeAreaLayoutGuide.snp.center)
//        }
//    }
//
//    func switchToMainPage() {
//        successView.removeFromSuperview()
//        configureConstraints()
//        fillContainer(subView: loginView)
//
//        loginButton.setTitleColor(CustomColors.selectedButtonColor, for: .normal)
//        signUpButton.setTitleColor(CustomColors.unselectedButtonColor, for: .normal)
//    }
    
}
