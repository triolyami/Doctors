//
//  ReviewTableViewCell.swift
//  Doctors
//
//  Created by Sergey on 24.06.2022.
//

import UIKit

final class ReviewTableViewCell: UITableViewCell {
    static let identifier = String(describing: ReviewTableViewCell.self)
    
    private enum Constants {
        static let userImageViewDefaultImageName = "DefaultUserImage"
        
        static let reviewerNameLabelNumberOfLines = 1
        
        static let reviewLabelNumberOfLines = 4
    }
    
    private enum Constraints {
        static let userImageViewTopOffset = 16
        static let userImageViewSize = 24
        
        static let reviewerNameLabelLeadingOffset = 8
        
        static let reviewLabelTopOffset = 9
        static let reviewLabelLeadingOffset = 8
        static let reviewLabelBottomInset = 16
    }
    
    private enum Texts {
        static let reviewerNameLabelDefaultText = "Anonymous feedback"
        static let reviewLabelDefaultText = "Very competent specialist. I am very happy that there are such professional doctors. My baby is in safe hands. My child's health is above all"
    }
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.userImageViewDefaultImageName)
        return imageView
    }()
    
    private let reviewerNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = Texts.reviewerNameLabelDefaultText
        label.font = AppFonts.semiBold14.font
        label.numberOfLines = Constants.reviewerNameLabelNumberOfLines
        return label
    }()
    
    private let reviewLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.regular12.font
        label.textAlignment = .left
        label.text = Texts.reviewLabelDefaultText
        label.numberOfLines = Constants.reviewLabelNumberOfLines
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ReviewTableViewCell {
    func setupLayout() {
        self.setupUserImageLayout()
        self.setupReviewerNameLabelLayout()
        self.setupReviewLabelLayout()
    }
    
    func setupUserImageLayout() {
        self.contentView.addSubview(self.userImageView)
        self.userImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constraints.userImageViewTopOffset)
            make.leading.equalToSuperview()
            make.width.height.equalTo(Constraints.userImageViewSize)
        }
    }
    
    func setupReviewerNameLabelLayout() {
        self.contentView.addSubview(self.reviewerNameLabel)
        self.reviewerNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.userImageView.snp.trailing).offset(Constraints.reviewerNameLabelLeadingOffset)
            make.trailing.equalToSuperview()
            make.centerY.equalTo(self.userImageView)
        }
    }
    
    func setupReviewLabelLayout() {
        self.contentView.addSubview(self.reviewLabel)
        self.reviewLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalTo(self.userImageView.snp.trailing).offset(Constraints.reviewLabelLeadingOffset)
            make.top.greaterThanOrEqualTo(self.reviewerNameLabel.snp.bottom).offset(Constraints.reviewLabelTopOffset)
            make.bottom.equalToSuperview().inset(Constraints.reviewLabelBottomInset)
        }
    }
}

