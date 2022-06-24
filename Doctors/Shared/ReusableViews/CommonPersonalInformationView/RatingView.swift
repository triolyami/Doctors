//
//  RatingView.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import UIKit

final class RatingView: BaseView {
    private enum Constants {
        static let starContainerViewCornerRadius = CGFloat(10)
        static let starImageName = "Star"
        static let commonNumberOfLines = 1
    }
    
    private enum Texts {
        static let ratingTitleRatingText = "Rating"
        static let ratingValueLabelDefaultText = "4.78 out of 5"
    }
    
    private enum Constraints {
        static let starImageViewSize = 20
        static let starImageViewEdges = 6
    }
    
    private let starContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.starContainerViewCornerRadius
        view.backgroundColor = AppColors.lightOrange.value
        return view
    }()
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.starImageName)
        return imageView
    }()
    
    private let ratingContainerView = UIView()
    
    private let ratingTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = Texts.ratingTitleRatingText
        label.textColor = AppColors.brightGrayTextColor.value
        label.font = AppFonts.regular12.font
        label.numberOfLines = Constants.commonNumberOfLines
        return label
    }()
    
    private let ratingValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = Texts.ratingValueLabelDefaultText
        label.font = AppFonts.semiBold12.font
        label.numberOfLines = Constants.commonNumberOfLines
        return label
    }()
    
    override init() {
        super.init()
        self.setupLayout()
    }
}

private extension RatingView {
    func setupLayout() {
        self.setupStarImageViewLayout()
        self.setupRatingContainerView()
        self.setupRatingTitleLabelLayout()
        self.setupRatingValueLayout()
    }
    
    func setupStarImageViewLayout() {
        self.addSubview(self.starContainerView)
        self.starContainerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        self.starContainerView.addSubview(self.starImageView)
        self.starImageView.snp.makeConstraints { make in
            make.width.height.equalTo(Constraints.starImageViewSize)
            make.edges.equalToSuperview().inset(Constraints.starImageViewEdges)
        }
    }
    
    func setupRatingContainerView() {
        self.addSubview(self.ratingContainerView)
        self.ratingContainerView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalTo(self.starContainerView.snp.trailing)
            make.centerY.equalTo(self.starContainerView)
        }
    }
    
    func setupRatingTitleLabelLayout() {
        self.ratingContainerView.addSubview(self.ratingTitleLabel)
        self.ratingTitleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
    }

    func setupRatingValueLayout() {
        self.ratingContainerView.addSubview(self.ratingValueLabel)
        self.ratingValueLabel.snp.makeConstraints { make in
            make.top.equalTo(self.ratingTitleLabel.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
