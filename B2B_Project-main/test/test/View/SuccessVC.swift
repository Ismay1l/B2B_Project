//
//  SuccessViewController.swift
//  test
//
//  Created by Ismayil Ismayilov on 21.08.22.
//

import UIKit

class SuccessVC: UIViewController {
    
    var delegate: SuccessViewDelegate?
    
    //MARK: - UI Elements
    
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var successIcon: UIImageView = {
        let icon = UIImageView(image: UIImage(named: "ic_success"))
        return icon
    }()
    
    private lazy var  successLabel = getLabel(text: "SUCCESS!",
                                        size: 24,
                                        weigth: .medium,
                                        color: "#FF8200")
    
    private lazy var descriptionLabel = getLabel(text: "Your registration was completed",
                                                 size: 18,
                                                 weigth: .regular,
                                                 color: "#75787B")
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = hexStringToUIColor(hex: "#FFA300")
        button.setTitle(" Back to login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setImage(UIImage(named: "ic_backArrow"), for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self,
                         action: #selector(didTapBack),
                         for: .touchUpInside)
        return button
    }()
    
    //MARK: - Parent Delegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureConstraints()
        
        self.navigationItem.hidesBackButton = true
    }
    
    //MARK: - Functions
    
    private func configureConstraints() {
        
        view.backgroundColor = .white
        
        view.addSubview(containerView)
        containerView.addSubview(successIcon)
        containerView.addSubview(successLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(backButton)
        
        
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        containerView.layer.shadowRadius = 10
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.backgroundColor = .white
        
        containerView.snp.makeConstraints { make in
            make.width.equalTo(290)
            make.height.equalTo(340)
            make.center.equalToSuperview()
        }
        
        successIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(69.5)
            make.centerX.equalToSuperview()
        }
        
        successLabel.snp.makeConstraints { make in
            make.top.equalTo(successIcon.snp.bottom).offset(25.5)
            make.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(successLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(79)
            make.right.equalToSuperview().offset(-79)
            make.height.equalTo(38)
        }
    }
    
    @objc private func didTapBack() {
        delegate?.didTapBackButton()
    }
}
