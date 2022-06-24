//
//  SymptomsCollectionViewCell.swift
//  Doctors
//
//  Created by Sergey on 16.06.2022.
//
import UIKit

final class SymptomsCollectionViewCell: BaseCollectionViewCell {
    private enum Constants {
        static let cornerRadius = CGFloat(16)
    }
    
    private enum Constrains {
        static let iconImageViewVerticalInset = 8
        static let iconImageViewLeadingOffset = 16
        static let iconImageViewSize = 32
        
        static let symptomeLabelLeadingOffset = 8
        static let symptomeLabelTrailingInset = 16
    }
    
    static let identifier = String(describing: SymptomsCollectionViewCell.self)
    
    private let iconImageView = UIImageView()
    
    private let symptomeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.configureView()
    }
}

extension SymptomsCollectionViewCell: IDisplayable {
    typealias T = SymptomViewModel
    func display(with vm: T) {
        self.symptomeLabel.text = vm.name
        self.iconImageView.image = UIImage(named: vm.imageName)
    }
}

private extension SymptomsCollectionViewCell {
    func configureView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = Constants.cornerRadius
    }
    
    func setupLayout() {
        setupIconImageViewLayout()
        setupSymptomLabelLayout()
    }
    
    func setupIconImageViewLayout() {
        self.contentView.addSubview(self.iconImageView)
        self.iconImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(Constrains.iconImageViewVerticalInset)
            make.leading.equalToSuperview().offset(Constrains.iconImageViewLeadingOffset)
            make.height.width.equalTo(Constrains.iconImageViewSize)
        }
    }
    
    func setupSymptomLabelLayout() {
        self.contentView.addSubview(self.symptomeLabel)
        self.symptomeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.iconImageView)
            make.leading.equalTo(self.iconImageView.snp.trailing).offset(Constrains.symptomeLabelLeadingOffset)
            make.trailing.equalToSuperview().inset(Constrains.symptomeLabelTrailingInset)
        }
    }
}
