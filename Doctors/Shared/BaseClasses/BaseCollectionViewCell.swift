//
//  BaseCollectionViewCell.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//
import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

