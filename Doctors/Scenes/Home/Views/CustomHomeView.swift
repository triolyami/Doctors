//
//  CustomSearchView.swift
//  Doctors
//
//  Created by Sergey on 16.06.2022.
//
import UIKit
import SnapKit

final class CustomHomeView: BaseView {
    
    private enum Constants {
        static let backgroundImage = "background"
        static let emptyViewWidth = 16
    }
    
    private enum Constraints {
        static let searchTextFieldHorizontalInset = 32
        static let searchTextFieldHeight = 48
        static let searchTextFieldBottomInset = 40
        
        static let symptomsViewLeadingOffset = 16
        
        static let newInvestigationViewTopOffset = 24
        static let newInvestigationViewHorizontalInset = 16
    }
    
    private enum Texts {
        static let searchTFPlaceholder = "Search here"
        static let weatherButtonText = "New weather note"
    }
    
    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Banner")
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
        
    private let searchTextField = CustomTextField(borderColor: AppColors.mainBlue.cgColor)
    
    private let symptomsView = SymptomsView()
    
    private let newInvestigationView = NewInvestigationsView()
    
    private var textFieldDelegate: ITextFieldDelegate?
    
    override init() {
        super.init()
        self.setupLayout()
        self.configureView()
    }
    
    func setNewInvestigations(with vmList: [NewInvestigationViewModel]) {
        self.newInvestigationView.setData(with: vmList)
    }
    
    func setSymptoms(with vmList: [SymptomViewModel]) {
        self.symptomsView.setData(with: vmList)
    }
}

private extension CustomHomeView {
    func configureView() {
        self.backgroundColor = AppColors.lightGray.value

    }
    
    func setupLayout() {
        self.setupBannerLayout()
        self.setupSearchTextFieldLayout()
        self.setupSymptomsViewLayout()
        self.setupNewInvestigationLayout()
    }
        
    func setupBannerLayout() {
        self.addSubview(self.bannerImageView)
        self.bannerImageView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(0)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func setupSearchTextFieldLayout() {
        self.addSubview(self.searchTextField)
        self.searchTextField.snp.makeConstraints { make in
            make.leading.equalTo(self.bannerImageView.snp.leading).offset(Constraints.searchTextFieldHorizontalInset)
            make.trailing.equalTo(self.bannerImageView.snp.trailing).inset(Constraints.searchTextFieldHorizontalInset)
            make.height.equalTo(Constraints.searchTextFieldHeight)
            make.bottom.equalTo(self.bannerImageView.snp.bottom).inset(Constraints.searchTextFieldBottomInset)
        }
    }
    
    func setupSymptomsViewLayout() {
        self.addSubview(self.symptomsView)
        self.symptomsView.snp.makeConstraints { make in
            make.top.equalTo(self.bannerImageView.snp.bottom)
            make.leading.equalToSuperview().offset(Constraints.symptomsViewLeadingOffset)
            make.trailing.equalToSuperview()
        }
    }
    
    func setupNewInvestigationLayout() {
        self.addSubview(self.newInvestigationView)
        self.newInvestigationView.snp.makeConstraints { make in
            make.top.equalTo(self.symptomsView.snp.bottom).offset(Constraints.newInvestigationViewTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constraints.newInvestigationViewHorizontalInset)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
