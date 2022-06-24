//
//  AppFonts.swift
//  Doctors
//
//  Created by Sergey on 20.06.2022.
//
import UIKit.UIFont

enum AppFonts {
    case regular12
    case regular14
    case regular16

    case bold20
    case semiBold12
    case semiBold14
    case semiBold16

    var font: UIFont? {
        switch self {
        case .regular12:
            return UIFont(name: "Montserrat-Regular", size: 12)
        case .regular14:
            return UIFont(name: "Montserrat-Regular", size: 14)
        case .regular16:
            return UIFont(name: "Montserrat-Regular", size: 16)
        case .bold20:
            return UIFont(name: "Montserrat-Bold", size: 20)
        case .semiBold16:
            return UIFont(name: "Montserrat-SemiBold", size: 16)
        case .semiBold14:
            return UIFont(name: "Montserrat-SemiBold", size: 14)
        case .semiBold12:
            return UIFont(name: "Montserrat-SemiBold", size: 12)
        }
    }
}
