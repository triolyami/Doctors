//
//  CommonPersonalInformationView.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import UIKit

final class CommonPersonalInformationView: BaseView {
    
    private enum Constants {
        static let commonNumberOfLines = 1
        static let defaultImageName = "Default"
    }
    
    private enum Constraints {
        static let profileLabelTopOffset = 4
        static let imageViewSize = 80
    }
    
    private enum Texts {
        static let profileLabelText = "Peduatrician"
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = AppFonts.semiBold16.font
        label.numberOfLines = Constants.commonNumberOfLines
        return label
    }()
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = Texts.profileLabelText
        label.font = AppFonts.regular12.font
        label.numberOfLines = Constants.commonNumberOfLines
        return label
    }()
    
    private let imageView = BaseRoundedImageView()
    
    private let ratingView = RatingView()
    
    override init() {
        super.init()
        self.setupLayout()
    }
    
    func display(with vm: DoctorViewModel) {
        if let image = vm.image {
            self.imageView.image = UIImage(data: image)
        } else {
            self.imageView.image = UIImage(named: Constants.defaultImageName)
        }

        self.nameLabel.text = vm.name
    }
    
    func display(with vm: AppointmentViewModel) {
        self.imageView.image = UIImage(data: vm.imageOfDoctor)
        self.nameLabel.text = vm.nameOfDoctor
    }
}

private extension CommonPersonalInformationView {
    func setupLayout() {
        self.setupNameLabelLayout()
        self.setupProfilelabelLayout()
        self.setupRatingViewLayout()
        self.setupImageViewlayout()
    }
    
    func setupNameLabelLayout() {
        self.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
    }
    
    func setupProfilelabelLayout() {
        self.addSubview(self.profileLabel)
        self.profileLabel.snp.makeConstraints { make in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(Constraints.profileLabelTopOffset)
            make.leading.equalToSuperview()
        }
    }
    
    func setupRatingViewLayout() {
        self.addSubview(self.ratingView)
        self.ratingView.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(self.profileLabel.snp.bottom)
            make.leading.bottom.equalToSuperview()
        }
    }
    
    func setupImageViewlayout() {
        self.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { make in
            make.width.height.equalTo(Constraints.imageViewSize)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}
