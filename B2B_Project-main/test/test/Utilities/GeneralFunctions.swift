//
//  GeneralFunctions.swift
//  test
//
//  Created by USER11 on 8/18/22.
//

import Foundation
import UIKit

func getLabel(text: String, size: Int, weigth: UIFont.Weight, color: String) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = .systemFont(ofSize: CGFloat(size), weight: weigth)
    label.textColor = hexStringToUIColor(hex: color)
    return label
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}

func getStackView() -> UIStackView {
    let view = UIStackView()
    view.distribution = .equalSpacing
    view.axis = .vertical
    view.alignment = .leading
    view.isBaselineRelativeArrangement = false
    view.spacing = 12
    return view
}

var correctTickIcon: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "ic_correct") , for: .normal)
    button.frame = CGRect(x:0, y:0, width:30, height:30)
    return button
}()

func getSignUpTextField(text: String) -> SignUpTextField {
    
    let field = SignUpTextField()
    let color = CustomColors.placeHolderColor
    field.attributedPlaceholder = NSAttributedString(
        string: text,
        attributes: [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular)])
    field.layer.cornerRadius = 10
    field.clipsToBounds = true
    field.layer.borderWidth = 1
    let borderColor = CustomColors.placeHolderColor
    field.layer.borderColor = borderColor.cgColor
    
    field.textColor = hexStringToUIColor(hex: "#231F20")
    field.font = .systemFont(ofSize: 14, weight: .semibold)
    
    return field
}

func getEmailTextField() -> EmailTextField {
    
    let field = EmailTextField()
    let textColor = CustomColors.placeHolderColor
    field.attributedPlaceholder = NSAttributedString(
        string: "Enter your email",
        attributes: [NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular)])
    field.layer.cornerRadius = 10
    field.clipsToBounds = true
    field.layer.borderWidth = 1
    let borderColor = CustomColors.placeHolderColor
    field.layer.borderColor = borderColor.cgColor
    
    field.textColor = hexStringToUIColor(hex: "#231F20")
    field.font = .systemFont(ofSize: 14, weight: .semibold)
    
    return field
}

func getAttributedFooterLabelForRegistrationPage(basicText: String, coloredString: String) -> NSMutableAttributedString {
    
    let attrstr1 = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.black]
    
    let attrstr2 = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.foregroundColor: hexStringToUIColor(hex: "#FFB500")]
    
    let attributedString1 = NSMutableAttributedString(string:basicText, attributes: attrstr1)
    
    let attributedString2 = NSMutableAttributedString(string:coloredString, attributes: attrstr2)
    
    attributedString1.append(attributedString2)
    
    return attributedString1
}


