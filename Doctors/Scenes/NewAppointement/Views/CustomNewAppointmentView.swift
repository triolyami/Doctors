//
//  CustomNewAppointmentView.swift
//  Doctors
//
//  Created by Sergey on 22.06.2022.
//
import UIKit

final class CustomNewAppointmentView: BaseView {
    private enum Constraints {
        static let navBarTopOffsest = 8
        
        static let commonHorizontalInset = 16
        
        static let nameOfDoctorLabelTopOffset = 20
        
        static let imageViewTopOffset = 20
        static let imageVeiwSize = 150
        
        static let datePickerTopOffset = 16
        
        static let takeThisTimeButtonBottomInset = 20
        static let takeThisTimeButtonHeight = 50
        static let takeThisTimeButtonWidth = 160
    }
    
    private enum Texts {
        static let navBarTitile = "Make an appointment"
        static let takeThisTimeButtonTitile = "Book this time"
    }
    
    private let navBar = NavigationBarWithBackButtonView(title: Texts.navBarTitile)
    
    private let nameOfDoctorLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.semiBold16.font
        label.textAlignment = .center
        return label
    }()
    
    private let imageView = BaseRoundedImageView()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "en")
        return datePicker
    }()
    
    private lazy var takeThisTimeButton: BaseCollectionViewButton = {
        let button = BaseCollectionViewButton()
        button.backgroundColor = AppColors.mainBlue.value
        button.setTitle(Texts.takeThisTimeButtonTitile, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = CommonConstants.cornerRadius
        button.titleLabel?.font = AppFonts.regular16.font
        button.addTarget(self, action: #selector(onTakeThisTimeButtonButtonTapped), for: .touchUpInside)
        button.typeOfOperation = .reshedule

        return button
    }()
    
    var takeThisTimeButtonHandler: ((Date) -> Void)?
        
    override init() {
        super.init()
        self.setupLayout()
        self.configureView()
    }
    
    func setData(with vm: DoctorProfileViewModel) {
        self.imageView.image = UIImage(data: vm.image)
        self.nameOfDoctorLabel.text = vm.name
    }
    
    func setBackButtonHandler(handler: @escaping () -> Void) {
        self.navBar.setBackButtonHandler(handler: handler)
    }
}

private extension CustomNewAppointmentView {
    @objc
    func onTakeThisTimeButtonButtonTapped() {
        let date = self.datePicker.date
        self.takeThisTimeButtonHandler?(date)
    }
    
    func configureView() {
        self.backgroundColor = AppColors.lightGray.value
    }
    
    func setupLayout() {
        self.setupNavBarLayout()
        self.setupNameOfDoctorLabel()
        self.setupImageViewLayout()
        self.setupDatePickerLayout()
        self.setupTakeThisButtonLayout()
    }
    
    func setupNavBarLayout() {
        self.addSubview(self.navBar)
        self.navBar.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(Constraints.navBarTopOffsest)
            make.leading.trailing.equalToSuperview().inset(Constraints.commonHorizontalInset)
        }
    }
    
    func setupNameOfDoctorLabel() {
        self.addSubview(self.nameOfDoctorLabel)
        self.nameOfDoctorLabel.snp.makeConstraints { make in
            make.top.equalTo(self.navBar.snp.bottom).offset(Constraints.nameOfDoctorLabelTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constraints.commonHorizontalInset)
        }
    }
    
    func setupImageViewLayout() {
        self.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { make in
            make.top.equalTo(self.nameOfDoctorLabel.snp.bottom).offset(Constraints.imageViewTopOffset)
            make.height.width.equalTo(Constraints.imageVeiwSize)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupDatePickerLayout() {
        self.addSubview(self.datePicker)
        self.datePicker.snp.makeConstraints { make in
            make.top.equalTo(self.imageView.snp.bottom).offset(Constraints.datePickerTopOffset)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupTakeThisButtonLayout() {
        self.addSubview(self.takeThisTimeButton)
        self.takeThisTimeButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(Constraints.takeThisTimeButtonBottomInset)
            make.width.equalTo(Constraints.takeThisTimeButtonWidth)
            make.height.equalTo(Constraints.takeThisTimeButtonHeight)
            make.centerX.equalToSuperview()
        }
    }
}

