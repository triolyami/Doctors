//
//  TextFieldView.swift
//  Doctors
//
//  Created by Sergey on 23.06.2022.
//

import UIKit

class TextFieldView: BaseView {
    private enum Constants {
        static let imageName = "Search"
    }
    
    private enum Constraints {
        static let imageViewSize = 28
        static let imageViewLeadingOffset = 8
        static let imageViewTrainlingInset = 4
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.imageName)
        return imageView
    }()
    
    override init() {
        super.init()
        self.setupLayout()
    }
}

private extension TextFieldView {
    func setupLayout() {
        self.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { make in
            make.width.height.equalTo(Constraints.imageViewSize)
            make.leading.equalToSuperview().offset(Constraints.imageViewLeadingOffset)
            make.trailing.equalToSuperview().inset(Constraints.imageViewTrainlingInset)
            make.centerY.equalToSuperview()
        }
    }
}
