//
//  NavigationBarWithBackButtonView.swift
//  Doctors
//
//  Created by Sergey on 20.06.2022.
//

import UIKit

final class NavigationBarWithBackButtonView: BaseView {
    private enum Constants {
        static let titleLabelNumberOfLines = 1
    }
    
    private enum Constraints {
        static let backButtonVerticalInset = 8
        static let backButtonSize = 32
    }
    
    private let backButton = BackButton()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = AppFonts.semiBold16.font
        label.numberOfLines = Constants.titleLabelNumberOfLines
        return label
    }()
        
    init(title: String) {
        super.init()
        self.titleLabel.text = title
        self.setupLayout()
    }
    
    func setBackButtonHandler(handler: @escaping () -> Void) {
        self.backButton.handler = handler
    }
}

private extension NavigationBarWithBackButtonView {    
    func setupLayout() {
        self.setupBackButtonLayout()
        self.setupTitleLabelLayout()
    }
    
    func setupBackButtonLayout() {
        self.addSubview(self.backButton)
        self.backButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(Constraints.backButtonVerticalInset)
            make.leading.equalToSuperview()
            make.height.width.equalTo(Constraints.backButtonSize)
        }
    }
    
    func setupTitleLabelLayout() {
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.backButton)
        }
    }
}
