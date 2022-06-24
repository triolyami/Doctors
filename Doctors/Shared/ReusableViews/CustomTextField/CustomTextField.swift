//
//  CustomTextField.swift
//  Doctors
//
//  Created by Sergey on 20.06.2022.
//

import UIKit

final class CustomTextField: UITextField {
    private enum Constants {
        static let emptyViewWidth = 16
        static let cornerRadius = CGFloat(10)
        static let borderWidth = CGFloat(1)
    }
    
    private enum Texts {
        static let textFieldPlaceholderText = "Search"
    }
    
    var textFieldDelegate: TextFieldDelegate?

    init(borderColor: CGColor) {
        super.init(frame: .zero)
        self.configureView(with: borderColor)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CustomTextField {
    func configureView(with borderColor: CGColor) {
        self.layer.borderColor = borderColor
        self.layer.borderWidth = Constants.borderWidth
        self.backgroundColor = AppColors.white.value
        self.layer.cornerRadius = Constants.cornerRadius
        self.layer.masksToBounds = true
        self.attributedPlaceholder = NSAttributedString(
            string: Texts.textFieldPlaceholderText,
            attributes: [
                NSAttributedString.Key.font: AppFonts.regular14.font as Any,
                NSAttributedString.Key.foregroundColor: AppColors.textFieldPlaceholderColor.value
            ]
        )
        let rightEmptyView = UIView(frame: .init(x: .zero, y: .zero, width: Constants.emptyViewWidth, height: .zero))
        let leftEmptyView = TextFieldView()
        
        self.leftViewMode = .always
        self.leftView = leftEmptyView
        self.rightViewMode = .always
        self.rightView = rightEmptyView
        self.textFieldDelegate = TextFieldDelegate()
        self.delegate = self.textFieldDelegate
    }
}
