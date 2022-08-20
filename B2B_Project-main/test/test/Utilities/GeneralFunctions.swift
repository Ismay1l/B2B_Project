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
