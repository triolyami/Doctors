//
//  BackButton.swift
//  Doctors
//
//  Created by Sergey on 20.06.2022.
//

import UIKit

final class BackButton: BaseView {
    private enum Constants {
        static let cornerRadius = CGFloat(10)
        static let imageViewName = "Back"
    }
    
    private enum Constraints {
        static let imageViewVerticalInset = 10
        static let imageViewHorizontalinset = 13
        static let imageViewHeight = 12
        static let imageViewWidth = 10
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.imageViewName)
        return imageView
    }()
    
    var handler: (() -> Void)?
    
    override init() {
        super.init()
        self.setupLayout()
        self.configureView()
    }
}

private extension BackButton {
    func configureView() {
        self.backgroundColor = AppColors.white.value
        self.layer.cornerRadius = Constants.cornerRadius
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        self.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc
    func viewTapped() {
        self.handler?()
    }
    
    func setupLayout() {
        self.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(Constraints.imageViewVerticalInset)
            make.trailing.leading.equalToSuperview().inset(Constraints.imageViewHorizontalinset)
            make.height.equalTo(Constraints.imageViewHeight)
            make.width.equalTo(Constraints.imageViewWidth)
        }
    }
}
