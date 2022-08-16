//
//  LoginViewController.swift
//  test
//
//  Created by USER11 on 8/16/22.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInView = SignInView()
    
    private enum Constants {
        static let segmentedControlHeight: CGFloat = 40
        static let underlineViewColor: UIColor = .orange
        static let underlineViewHeight: CGFloat = 2
    }

    //MARK: - UIElements
    
    private lazy var containerView : UIView = {
            let view = UIView()
            view.backgroundColor = .white
            return view
        }()
    
    private lazy var segmentedControlContainerView: UIView = {
            let containerView = UIView()
            containerView.backgroundColor = .white
            containerView.translatesAutoresizingMaskIntoConstraints = false
            return containerView
        }()
    
    private lazy var segmentedControl: UISegmentedControl = {
           let segmentedControl = UISegmentedControl()

           // Remove background and divider colors
           segmentedControl.backgroundColor = .white
           segmentedControl.tintColor = .white
        
           // Append segments
           segmentedControl.insertSegment(withTitle: "Login", at: 0, animated: true)
           segmentedControl.insertSegment(withTitle: "Sign up", at: 1, animated: true)

           // Select first segment by default
           segmentedControl.selectedSegmentIndex = 0

           // Change text color and the font of the NOT selected (normal) segment
           segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium)], for: .normal)

           // Change text color and the font of the selected segment
           segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.orange,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .selected)

           // Set up event handler to get notified when the selected segment changes
           segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)

           // Return false because we will set the constraints with Auto Layout
           segmentedControl.translatesAutoresizingMaskIntoConstraints = false
           return segmentedControl
       }()
    
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
    
    private lazy var bottomUnderlineView: UIView = {
           let underlineView = UIView()
           underlineView.backgroundColor = Constants.underlineViewColor
           underlineView.translatesAutoresizingMaskIntoConstraints = false
           return underlineView
       }()
    
    private lazy var leadingDistanceConstraint: NSLayoutConstraint = {
            return bottomUnderlineView.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor)
        }()
    
    private lazy var headerLabelExpress: UILabel = {
        let label = UILabel()
        
        label.text = "Express24"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        
        label.textColor = .systemOrange
        
        return label
    }()
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Login to your account"
        label.textColor = hexStringToUIColor(hex: "#231F20")
        
        label.font = .systemFont(ofSize: 24, weight: .medium)
        
        return label
    }()

    //MARK: - Parent Delegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(headerLabelExpress)
        view.addSubview(headerLabel)
        view.addSubview(loginLabel)
        view.addSubview(segmentedControlContainerView)
        segmentedControlContainerView.addSubview(segmentedControl)
        segmentedControlContainerView.addSubview(bottomUnderlineView)
        self.view.addSubview(self.containerView)
        
        fillContainer(segmentView: loginView)
        
        let safeLayoutGuide = self.view.safeAreaLayoutGuide
        
        segmentedControlContainerView.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(32)
            make.left.equalTo(safeLayoutGuide.snp.left)
            make.right.equalTo(safeLayoutGuide.snp.right)
//            make.height.equalTo(40)
        }
        
        // Constrain the segmented control to the container view
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: segmentedControlContainerView.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: segmentedControlContainerView.leadingAnchor),
            segmentedControl.centerXAnchor.constraint(equalTo: segmentedControlContainerView.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: segmentedControlContainerView.centerYAnchor)
        ])
        
        // Constrain the underline view relative to the segmented control
        NSLayoutConstraint.activate([
            bottomUnderlineView.bottomAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            bottomUnderlineView.heightAnchor.constraint(equalToConstant: Constants.underlineViewHeight),
            leadingDistanceConstraint,
            bottomUnderlineView.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1 / CGFloat(segmentedControl.numberOfSegments))
        ])
        
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(48)
        }
        
        headerLabelExpress.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(headerLabel.snp.bottom).offset(-10)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabelExpress.snp.bottom).offset(24)
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControlContainerView.snp.bottom)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
                case 0:
                    self.fillContainer(segmentView: self.loginView)
                    break
                case 1:
                    self.fillContainer(segmentView: self.signInView)
                    break
                default:
                    break
                }
            changeSegmentedControlLinePosition()
        }
    
    private func fillContainer ( segmentView: UIView) {
            self.containerView.subviews.forEach { subview in
                subview.removeFromSuperview()
            }
            
            self.containerView.addSubview(segmentView)
            
            segmentView.snp.makeConstraints { make in
                make.top.left.right.bottom.equalToSuperview()
            }
        }
    
    private func changeSegmentedControlLinePosition() {
            let segmentIndex = CGFloat(segmentedControl.selectedSegmentIndex)
            let segmentWidth = segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)
            let leadingDistance = segmentWidth * segmentIndex
            UIView.animate(withDuration: 0.3, animations: { [weak self] in
                self?.leadingDistanceConstraint.constant = leadingDistance
//                self?.layoutIfNeeded()
            })
        }
}
