//
//  CustomUpdateAppointmentView.swift
//  Doctors
//
//  Created by Sergey on 23.06.2022.
//

import UIKit

class CustomUpdateAppointmentView: BaseView {
    private enum Constraints {
        static let datePickerTopOffset = 50
        
        static let resheduleButtonBottomInset = 80
        static let resheduleButtonHeight = 50
        static let resheduleButtonWidth = 170
    }
    
    private enum Texts {
        static let resheduleButtonTitle = "Reshedule"
    }
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "en")
        return datePicker
    }()
    
    private lazy var resheduleButton: BaseCollectionViewButton = {
        let button = BaseCollectionViewButton()
        button.backgroundColor = AppColors.mainBlue.value
        button.setTitle(Texts.resheduleButtonTitle, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = CommonConstants.cornerRadius
        button.titleLabel?.font = AppFonts.regular16.font
        button.addTarget(self, action: #selector(onResheduleButtonTapped), for: .touchUpInside)
        button.typeOfOperation = .reshedule

        return button
    }()
    
    var resheduleButtonhHandler: ((Date) -> Void)?
    
    override init() {
        super.init()
        self.setupLayout()
        self.configureView()
    }
    
    func setData(with date: Date) {
        self.datePicker.date = date
    }
}

private extension CustomUpdateAppointmentView {
    @objc
    func onResheduleButtonTapped() {
        self.resheduleButtonhHandler?(self.datePicker.date)
    }
    
    func configureView() {
        self.backgroundColor = AppColors.lightGray.value
    }
    
    func setupLayout() {
        self.setupDatePickerLayout()
        self.setupResheduleButtonLayout()
    }
    
    func setupDatePickerLayout() {
        self.addSubview(self.datePicker)
        self.datePicker.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(Constraints.datePickerTopOffset)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupResheduleButtonLayout() {
        self.addSubview(self.resheduleButton)
        self.resheduleButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(Constraints.resheduleButtonBottomInset)
            make.centerX.equalToSuperview()
            make.height.equalTo(Constraints.resheduleButtonHeight)
            make.width.equalTo(Constraints.resheduleButtonWidth)
        }
    }
}
