//
//  CustomNavigationBarView.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import Foundation
import UIKit

final class CustomRootNavigationBarView: BaseView {
    
    private enum Constraints{
        static let addButtonVerticalInset = 5
        static let addButtonWidth = 96
    }
    
    private enum Texts {
        static let todayLabelText = "Today"
        static let addButtonTitle = "+ Add"
    }
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = DateConverter.showDateForNavBar()
        label.textAlignment = .left
        label.font = AppFonts.regular14.font
        label.textColor = AppColors.grayTextColor.value
        return label
    }()
    
    private let todayLabel: UILabel = {
        let label = UILabel()
        label.text = Texts.todayLabelText
        label.font = AppFonts.bold20.font
        return label
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle(Texts.addButtonTitle, for: .normal)
        button.backgroundColor = AppColors.mainBlue.value
        button.layer.masksToBounds = true
        button.layer.cornerRadius = CommonConstants.cornerRadius
        button.titleLabel?.font = AppFonts.regular16.font
        button.addTarget(self, action: #selector(onButtonAddTapped), for: .touchUpInside)
        return button
    }()
    
    var addButtonHandler: (() -> Void)?
    
    override init() {
        super.init()
        self.setupLayout()
    }
}

private extension CustomRootNavigationBarView {
    @objc
    func onButtonAddTapped() {
        self.addButtonHandler?()
    }
    
    func setupLayout() {
        self.setupDateLabelLayout()
        self.setupTodayLabelLayout()
        self.setupAddButtonLayout()
    }
    
    func setupDateLabelLayout() {
        self.addSubview(self.dateLabel)
        self.dateLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    func setupTodayLabelLayout() {
        self.addSubview(self.todayLabel)
        self.todayLabel.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(self.dateLabel.snp.bottom)
            make.leading.bottom.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setupAddButtonLayout() {
        self.addSubview(self.addButton)
        self.addButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(Constraints.addButtonVerticalInset)
            make.trailing.equalToSuperview()
            make.width.equalTo(Constraints.addButtonWidth)
        }
    }
}
