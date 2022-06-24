//
//  DoctorCollectionViewCell.swift
//  Doctors
//
//  Created by Sergey on 20.06.2022.
//

import UIKit

final class DoctorCollectionViewCell: BaseCollectionViewCell {
    static let identifier = String(describing: DoctorCollectionViewCell.self)
    
    private enum Constraints {
        static let commonInset = 16
    }
    
    private let commonPersonalInformationView = CommonPersonalInformationView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.configureView()
    }
}

extension DoctorCollectionViewCell: IDisplayable {
    typealias T = DoctorViewModel
    func display(with vm: T) {
        self.commonPersonalInformationView.display(with: vm)
    }
}

private extension DoctorCollectionViewCell {
    func configureView() {
        self.layer.cornerRadius = CommonConstants.cornerRadius
        self.backgroundColor = AppColors.white.value
    }
    
    func setupLayout() {
        self.setupCommonPersonalInformationViewLayout()
    }
    
    func setupCommonPersonalInformationViewLayout() {
        self.contentView.addSubview(self.commonPersonalInformationView)
        self.commonPersonalInformationView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(Constraints.commonInset)
            make.leading.trailing.equalToSuperview().inset(Constraints.commonInset)
        }
    }
}
