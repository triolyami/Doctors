//
//  AppointmentCollectionViewCell.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import UIKit

final class AppointmentCollectionViewCell: BaseCollectionViewCell {
    
    static let identifier = String(describing: AppointmentCollectionViewCell.self)
    
    private enum Constants {
        static let buttonsCornerRadius = CGFloat(12)
    }
    
    private enum Constraints {
        static let commonPersonalinformationViewCommonInset = 16
        
        static let timeOfAppointmentViewTopOffset = 20
        static let timeOfAppointmentViewHorizontalInset = 16
        
        static let buttonsCommonInset = 16
        static let buttonsWidth = 146
        static let ButtonsHeight = 38
    }
    
    private enum Texts {
        static let resheduleButtonTitle = "Reshedule"
        static let cancelButtonTitle = "Cancel"
    }
    
    private let commonPersonalinformationView = CommonPersonalInformationView()
    
    private let timeOfAppointmentView = TimeOfAppointmentView()
    private lazy var resheduleButton: BaseCollectionViewButton = {
        let button = BaseCollectionViewButton()
        button.backgroundColor = AppColors.mainBlue.value
        button.setTitle(Texts.resheduleButtonTitle, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.buttonsCornerRadius
        button.titleLabel?.font = AppFonts.regular16.font
        button.addTarget(self, action: #selector(onButtonPresssed(button:)), for: .touchUpInside)
        button.typeOfOperation = .reshedule

        return button
    }()
    
    private lazy var cancelButton: BaseCollectionViewButton = {
        let button = BaseCollectionViewButton()
        button.backgroundColor = AppColors.white.value
        button.setTitle(Texts.cancelButtonTitle, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.buttonsCornerRadius
        button.layer.borderColor = AppColors.mainBlue.cgColor
        button.layer.borderWidth = 1
        button.setTitleColor(AppColors.mainBlue.value, for: .normal)
        button.titleLabel?.font = AppFonts.regular16.font
        button.addTarget(self, action: #selector(onButtonPresssed(button:)), for: .touchUpInside)
        button.typeOfOperation = .cancel

        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.configureView()
    }
    
    private var buttonsHandler: ((TypeOfOperation?, UUID?) -> Void)?

        
    func displayData(with vm: AppointmentViewModel, handler: ((TypeOfOperation?, UUID?) -> Void)?) {
        self.commonPersonalinformationView.display(with: vm)
        self.timeOfAppointmentView.setTime(with: vm.time)
        self.buttonsHandler = handler
        self.setButtonsId(with: vm.id)
    }
}

private extension AppointmentCollectionViewCell {
    @objc
    func onButtonPresssed(button: BaseCollectionViewButton) {
        self.buttonsHandler?(button.typeOfOperation, button.id)
    }
    
    func configureView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = CommonConstants.cornerRadius
    }
    
    func setupLayout() {
        self.setupcommonPersonalinformationViewLayout()
        self.setupTimeOfAppointmentViewLayout()
        self.setupResheduleButtonLayout()
        self.setupCancelButtonLayout()
    }
    
    func setupcommonPersonalinformationViewLayout() {
        self.contentView.addSubview(self.commonPersonalinformationView)
        self.commonPersonalinformationView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(Constraints.commonPersonalinformationViewCommonInset)
        }
    }
    
    func setupTimeOfAppointmentViewLayout() {
        self.contentView.addSubview(self.timeOfAppointmentView)
        self.timeOfAppointmentView.snp.makeConstraints { make in
            make.top.equalTo(self.commonPersonalinformationView.snp.bottom).offset(Constraints.timeOfAppointmentViewTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constraints.timeOfAppointmentViewHorizontalInset)
        }
    }
    
    func setupResheduleButtonLayout() {
        self.contentView.addSubview(self.resheduleButton)
        self.resheduleButton.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(self.timeOfAppointmentView.snp.bottom).offset(Constraints.buttonsCommonInset)
            make.width.equalTo(Constraints.buttonsWidth)
            make.height.equalTo(Constraints.ButtonsHeight)
            make.leading.bottom.equalToSuperview().inset(Constraints.buttonsCommonInset)
        }
    }
    
    func setupCancelButtonLayout() {
        self.contentView.addSubview(self.cancelButton)
        self.cancelButton.snp.makeConstraints { make in
            make.centerY.equalTo(self.resheduleButton)
            make.width.equalTo(Constraints.buttonsWidth)
            make.height.equalTo(Constraints.ButtonsHeight)
            make.trailing.equalToSuperview().inset(Constraints.buttonsCommonInset)
        }
    }
    
    func setButtonsId(with id: UUID) {
        self.resheduleButton.id = id
        self.cancelButton.id = id
    }
}
