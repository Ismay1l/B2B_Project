//
//  Enums.swift
//  test
//
//  Created by Ismayil Ismayilov on 17.08.22.
//

import Foundation
import UIKit

enum Constants {
    static let segmentedControlHeight: CGFloat = 40
    static let underlineViewColor: UIColor = .orange
    static let underlineViewHeight: CGFloat = 2
}

enum CustomColors {
    static let unselectedButtonColor = hexStringToUIColor(hex: "#231F20") // - Registration View Button black color
    static let selectedButtonColor = hexStringToUIColor(hex: "#FFB500") // - Registration View Button selected color
    static let generalUnderlineColor = hexStringToUIColor(hex: "#D0D0CE")
    static let placeHolderColor = hexStringToUIColor(hex: "#D0D0CE") // - TextField Border Color
    static let tabBarTintColor = hexStringToUIColor(hex: "#FFA300")
}
