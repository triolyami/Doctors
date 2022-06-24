//
//  SymptomsCollectionViewCell.swift
//  Doctors
//
//  Created by Sergey on 16.06.2022.
//
import UIKit

final class NewInvestigationViewCollectionCell: BaseCollectionViewCell {
    
    static let identifier = String(describing: NewInvestigationViewCollectionCell.self)
    
    private enum Constants {
        static let titleLabelNumberOfLines = 1
        static let contentLabelNumbersOfLines = 3
        
        static let defaultImageName = "Default"
        
    }
    
    private enum Constraints {
        static let verticalInset = 16
        static let investigationImageViewLeadingOffset = 16
        
        static let leadingLabelsOffset = 8
        static let trailingLabelsInset = 16
        
        static let contentLabelTopOffset = 4
    }
    
    private let investigationImageView = BaseRoundedImageView()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = AppFonts.semiBold14.font
        label.numberOfLines = Constants.titleLabelNumberOfLines
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.regular12.font
        label.textAlignment = .left
        label.numberOfLines = Constants.contentLabelNumbersOfLines
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.configureView()
    }        
}

extension NewInvestigationViewCollectionCell: IDisplayable {
    typealias T = NewInvestigationViewModel
    func display(with vm: T) {
        if let storngData = vm.urlToImage {
            self.investigationImageView.image = UIImage(data: storngData)
        } else {
            self.investigationImageView.image = UIImage(named: Constants.defaultImageName)
        }
        self.titleLabel.text = vm.title
        self.contentLabel.text = vm.content
    }
    
}

private extension NewInvestigationViewCollectionCell {
    func configureView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = CommonConstants.cornerRadius
    }
    
    func setupLayout() {
        self.setupImvestigationImageViewLayout()
        self.setupTitleLabelLayout()
        self.setupContentLabel()
    }
    
    func setupImvestigationImageViewLayout() {
        self.contentView.addSubview(self.investigationImageView)
        self.investigationImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(Constraints.verticalInset)
            make.leading.equalToSuperview().offset(Constraints.investigationImageViewLeadingOffset)
            make.width.equalTo(self.investigationImageView.snp.height)
            
        }
    }
    
    func setupTitleLabelLayout() {
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constraints.verticalInset)
            make.leading.equalTo(self.investigationImageView.snp.trailing).offset(Constraints.leadingLabelsOffset)
            make.trailing.equalToSuperview().inset(Constraints.trailingLabelsInset)
        }
    }
    
    func setupContentLabel() {
        self.contentView.addSubview(self.contentLabel)
        self.contentLabel.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(Constraints.contentLabelTopOffset)
            make.leading.equalTo(self.investigationImageView.snp.trailing).offset(Constraints.leadingLabelsOffset)
            make.trailing.equalToSuperview().inset(Constraints.trailingLabelsInset)
        }
    }
}
