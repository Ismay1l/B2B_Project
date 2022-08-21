//
//  SuccessViewController.swift
//  test
//
//  Created by Ismayil Ismayilov on 21.08.22.
//

import UIKit

class SuccessView: UIView {
    
    var delegate: SuccessViewDelegate?
    
    //MARK: - UI Elements
    
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
        configureConstraints()
    }
    
    private func configureConstraints() {
        
        backgroundColor = .white
        
        addSubview(successIcon)
        addSubview(successLabel)
        addSubview(descriptionLabel)
        addSubview(backButton)
        
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
