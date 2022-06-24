//
//  BaseImageView.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import UIKit

final class BaseRoundedImageView: UIImageView {
    
    init() {
        super.init(frame: .zero)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = CommonConstants.cornerRadius
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
