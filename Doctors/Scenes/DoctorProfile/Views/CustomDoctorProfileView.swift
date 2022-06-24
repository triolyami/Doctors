//
//  CustomDoctorProfileView.swift
//  Doctors
//
//  Created by Sergey on 22.06.2022.
//

import UIKit

final class CustomDoctorProfileView: BaseView {
    private enum Constants {
        static let nameOfDoctorLabelNumberOfLines = 1
    }
    
    private enum Constraints {
        static let commonHorizontalInset = 16

        static let navBarTopOffset = 8
                
        static let scrollContainerViewTopOffset = 8
        
        static let imageViewTopOffset = 4
        static let imageViewSize = 130
        
        static let reviewViewTopOffset = 16
        static let reviewViewHeight = 250
        
        static let additionalInformationViewTopOffset = 16
        
        static let emptyViewHeight = 70
        
        static let makeAnAppointmentButtonBottomInset = 8
        static let makeAnAppointmentButtonHeight = 50
    }
    
    private enum Texts {
        static let navBarTitile = "Profile"
        static let makeAnAppointmentButtonTitile = "Make an appointment"
    }
    
    private let navBar = NavigationBarWithBackButtonView(title: Texts.navBarTitile)
    
    private let scrollView = UIScrollView()
    private let scrollContainerView = UIView()
    
    private let nameOfDoctorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = Constants.nameOfDoctorLabelNumberOfLines
        label.textAlignment = .center
        label.font = AppFonts.semiBold16.font
        return label
    }()
    
    private let imageView = BaseRoundedImageView()
    
    private let reviewView = ReviewView()
    
    private let additionalInformationView = AdditionalInfoView()
    
    private let emptyView = UIView()
    
    private lazy var makeAnAppointmentButton: BaseCollectionViewButton = {
        let button = BaseCollectionViewButton()
        button.backgroundColor = AppColors.mainBlue.value
        button.setTitle(Texts.makeAnAppointmentButtonTitile, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = CommonConstants.cornerRadius
        button.titleLabel?.font = AppFonts.regular16.font
        button.addTarget(self, action: #selector(onMakeAnAppointmentButtonTapped), for: .touchUpInside)
        button.typeOfOperation = .reshedule

        return button
    }()
    
    var makeAnAppointmentButtonhandler: (() -> Void)?
    
    override init() {
        super.init()
        self.setupLayout()
        self.configureView()
    }
    
    func setData(with vm: DoctorProfileViewModel) {
        self.imageView.image = UIImage(data: vm.image)
        self.nameOfDoctorLabel.text = vm.name
    }
    
    func setButtonBackHandler(handler: @escaping () -> Void) {
        self.navBar.setBackButtonHandler(handler: handler)
    }
}

private extension CustomDoctorProfileView {
    @objc
    func onMakeAnAppointmentButtonTapped() {
        makeAnAppointmentButtonhandler?()
    }
    
    func configureView() {
        self.backgroundColor = AppColors.lightGray.value
    }
    
    func setupLayout() {
        self.setupNavBarLayout()
        self.setupScrollViewLayout()
        self.setupNameOfDoctorLabelLayout()
        self.setupDoctorImageViewlayout()
        self.setupReviewViewLayout()
        self.setupAdditionalInfoLayout()
        self.setupEmptyViewLayout()
        self.setupButtonLayout()
    }
    
    func setupNavBarLayout() {
        self.addSubview(self.navBar)
        self.navBar.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(Constraints.navBarTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constraints.commonHorizontalInset)
        }
    }
    
    func setupScrollViewLayout() {
        self.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { make in
            make.top.equalTo(self.navBar.snp.bottom)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
        self.scrollView.addSubview(self.scrollContainerView)
        self.scrollContainerView.snp.makeConstraints { make in
            make.edges.equalTo(self.scrollView)
            make.width.equalToSuperview()
        }
    }
    
    func setupNameOfDoctorLabelLayout() {
        self.scrollContainerView.addSubview(self.nameOfDoctorLabel)
        self.nameOfDoctorLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.scrollContainerView).inset(Constraints.commonHorizontalInset)
            make.top.equalTo(self.scrollContainerView).offset(Constraints.scrollContainerViewTopOffset)
        }
    }
    
    func setupDoctorImageViewlayout() {
        self.scrollContainerView.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { make in
            make.top.equalTo(self.nameOfDoctorLabel.snp.bottom).offset(Constraints.imageViewTopOffset)
            make.width.height.equalTo(Constraints.imageViewSize)
            make.centerX.equalTo(self.scrollContainerView)
        }
    }
    
    func setupReviewViewLayout() {
        self.scrollContainerView.addSubview(self.reviewView)
        self.reviewView.snp.makeConstraints { make in
            make.top.equalTo(self.imageView.snp.bottom).offset(Constraints.reviewViewTopOffset)
            make.leading.trailing.equalTo(self.scrollContainerView).inset(Constraints.commonHorizontalInset)
            make.height.equalTo(Constraints.reviewViewHeight)
        }
    }
    
    func setupAdditionalInfoLayout() {
        self.scrollContainerView.addSubview(self.additionalInformationView)
        self.additionalInformationView.snp.makeConstraints { make in
            make.top.equalTo(self.reviewView.snp.bottom).offset(Constraints.additionalInformationViewTopOffset)
            make.leading.trailing.equalTo(self.scrollContainerView).inset(Constraints.commonHorizontalInset)
        }
    }
    
    func setupEmptyViewLayout() {
        self.scrollContainerView.addSubview(self.emptyView)
        self.emptyView.snp.makeConstraints { make in
            make.top.equalTo(self.additionalInformationView.snp.bottom)
            make.height.equalTo(Constraints.emptyViewHeight)
            make.leading.trailing.equalTo(self.scrollContainerView)
            make.bottom.equalTo(self.scrollContainerView)
        }
    }
    
    func setupButtonLayout() {
        self.addSubview(self.makeAnAppointmentButton)
        self.makeAnAppointmentButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(Constraints.makeAnAppointmentButtonBottomInset)
            make.leading.trailing.equalToSuperview().inset(Constraints.commonHorizontalInset)
            make.height.equalTo(Constraints.makeAnAppointmentButtonHeight)
        }
    }
}
