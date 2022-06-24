//
//  TextFieldDelegate.swift
//  Doctors
//
//  Created by Sergey on 16.06.2022.

import UIKit

protocol ITextFieldDelegate: UITextFieldDelegate {
    var tapReturnHandler: ((String) -> Void)? { get set }
}

final class TextFieldDelegate: NSObject {
    private enum Texts {
        static let textFieldPlaceholderText = "Search"
    }
    
    var tapReturnHandler: ((String) -> Void)?
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            tapReturnHandler?(text)
        }
        textField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.placeholder = textField.text
        textField.text = ""
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.placeholder == Texts.textFieldPlaceholderText {
            textField.text = ""
        } else {
            textField.text = textField.placeholder
        }
    }
}

extension TextFieldDelegate: ITextFieldDelegate {
    
}
