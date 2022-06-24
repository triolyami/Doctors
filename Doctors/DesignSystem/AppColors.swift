//
//  Colors.swift
//  Doctors
//
//  Created by Sergey on 16.06.2022.
//

import UIKit.UIColor


enum AppColors {
    case white
    case lightGray
    case mainBlue
    case lightOrange
    case lightBlue
    case grayTextColor
    case brightGrayTextColor
    case textFieldPlaceholderColor

    var value: UIColor {
        switch self {
        case .lightGray:
            return UIColor(red: 250/255, green: 250/255, blue: 254/255, alpha: 1)
        case .white:
            return UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        case .mainBlue:
            return UIColor(red: 22/255, green: 72/255, blue: 206/255, alpha: 1)
        case .lightOrange:
            return UIColor(red: 239/255, green: 128/255, blue: 47/255, alpha: 0.05)
        case .lightBlue:
            return UIColor(red: 245/255, green: 250/255, blue: 255/255, alpha: 1)
        case .grayTextColor:
            return UIColor(red: 146/255, green: 156/255, blue: 173/255, alpha: 1)
        case .brightGrayTextColor:
            return UIColor(red: 87/255, green: 90/255, blue: 97/255, alpha: 1)
        case .textFieldPlaceholderColor:
            return UIColor(red: 165/255, green: 188/255, blue: 231/255, alpha: 1)
        }
    }

    var cgColor: CGColor {
        return self.value.cgColor
    }
}
