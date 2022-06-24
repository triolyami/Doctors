//
//  ReviewTableViewHeader.swift
//  Doctors
//
//  Created by Sergey on 24.06.2022.
//
import UIKit

final class ReviewTableViewHeader: UITableViewHeaderFooterView {
    static let identifier = String(describing: ReviewTableViewHeader.self)
    
    private enum Constraints {
        static let ratingViewBottom = 16
    }
    
    private let ratingView = RatingView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupLayout()
        self.configureView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ReviewTableViewHeader {
    func configureView() {
        self.backgroundColor = AppColors.white.value
    }
    
    func setupLayout() {
        self.contentView.addSubview(self.ratingView)
        self.ratingView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(Constraints.ratingViewBottom)
        }
    }
}
