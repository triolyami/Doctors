//
//  ReviewsView.swift
//  Doctors
//
//  Created by Sergey on 24.06.2022.
//

import UIKit

final class ReviewView: BaseView {
    private enum Constraints {
        static let tableViewHorizontslInset = 16
        static let tableViewBottomInset = 16
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(ReviewTableViewCell.self, forCellReuseIdentifier: ReviewTableViewCell.identifier)
        tableView.register(ReviewTableViewHeader.self, forHeaderFooterViewReuseIdentifier: ReviewTableViewHeader.identifier)
        tableView.separatorStyle = .singleLine
        self.reviewTableViewDataSource = ReviewTableViewDataSource()
        self.reviewTableViewDelegate = ReviewTableViewDelegate()
        tableView.delegate = self.reviewTableViewDelegate
        tableView.dataSource = self.reviewTableViewDataSource
        return tableView
    }()
    
    private var reviewTableViewDataSource: ReviewTableViewDataSource?
    private var reviewTableViewDelegate: ReviewTableViewDelegate?
    
    override init() {
        super.init()
        self.setupLayout()
        self.configureView()
    }
}

private extension ReviewView {
    func configureView() {
        self.backgroundColor = AppColors.white.value
        self.layer.cornerRadius = CommonConstants.cornerRadius
    }
    
    func setupLayout() {
        self.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Constraints.tableViewHorizontslInset)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(Constraints.tableViewBottomInset)
        }
    }
}
