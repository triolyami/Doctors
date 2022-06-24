//
//  AdditionalinfoView.swift
//  Doctors
//
//  Created by Sergey on 24.06.2022.
//

import UIKit

final class AdditionalInfoView: BaseView {
    private enum Constants {
        static let titlesNumberOfLines = 1
        static let educationDescribtionlabelNumberOfLines = 0
        static let locationImageViewDefaultImageName = "Location"
    }
    
    private enum Constraints {
        static let commonHorizontalInset = 16

        static let educationTitleEdgesInset = 16
        
        static let educationDescribtionlabelTopOffset = 8
        
        static let locationtTitleTopOffset = 24
        
        static let locationImageViewTopOffset = 8
    }
    
    private enum Texts {
        static let educationTitleText = "Education"
        static let educationDescribtionlabelDefaultText = """
        Engaged in the effective treatment of disability, depression, chronic fatiguesyndrome, fears, anxiety, apathy and lethargy, sleep disorders, schizophrenia, mental disorders in the elderly and senile. Also, conducts a reception in English
        """
        static let locationtTitleText = "Location"
    }
    
    private let educationTitle: UILabel = {
        let label = UILabel()
        label.text = Texts.educationTitleText
        label.font = AppFonts.semiBold16.font
        label.textColor = AppColors.brightGrayTextColor.value
        label.numberOfLines = Constants.titlesNumberOfLines
        return label
    }()
    
    private let educationDescribtionlabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.regular12.font
        label.text = Texts.educationDescribtionlabelDefaultText
        label.numberOfLines = Constants.educationDescribtionlabelNumberOfLines
        return label
    }()
    
    private let locationtTitle: UILabel = {
        let label = UILabel()
        label.text = Texts.locationtTitleText
        label.font = AppFonts.semiBold16.font
        label.textColor = AppColors.brightGrayTextColor.value
        label.numberOfLines = Constants.titlesNumberOfLines
        return label
    }()
    
    private let locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.locationImageViewDefaultImageName)
        return imageView
    }()
    
    override init() {
        super.init()
        self.setupLayout()
        self.configureView()
    }
}

private extension AdditionalInfoView {
    func configureView() {
        self.backgroundColor = AppColors.white.value
        self.layer.cornerRadius = CommonConstants.cornerRadius
    }
    
    func setupLayout() {
        self.setupEducationTitleLayout()
        self.setupEducationDescribtionLabelLayout()
        self.setupLocationTitleLayout()
        self.setupLocationImageViewLayout()
        
    }
    
    func setupEducationTitleLayout() {
        self.addSubview(self.educationTitle)
        self.educationTitle.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(Constraints.educationTitleEdgesInset)
        }
    }
    
    func setupEducationDescribtionLabelLayout() {
        self.addSubview(self.educationDescribtionlabel)
        self.educationDescribtionlabel.snp.makeConstraints { make in
            make.top.equalTo(self.educationTitle.snp.bottom).offset(Constraints.educationDescribtionlabelTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constraints.commonHorizontalInset)
        }
    }
    
    func setupLocationTitleLayout() {
        self.addSubview(self.locationtTitle)
        self.locationtTitle.snp.makeConstraints { make in
            make.top.equalTo(self.educationDescribtionlabel.snp.bottom).offset(Constraints.locationtTitleTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constraints.commonHorizontalInset)
        }
    }
    
    func setupLocationImageViewLayout() {
        self.addSubview(self.locationImageView)
        self.locationImageView.snp.makeConstraints { make in
            make.top.equalTo(self.locationtTitle.snp.bottom).offset(Constraints.locationImageViewTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constraints.locationtTitleTopOffset)
            make.bottom.equalToSuperview()
        }
    }
}
