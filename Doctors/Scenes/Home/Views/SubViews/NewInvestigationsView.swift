//
//  NewInvestigationsView.swift
//  Doctors
//
//  Created by Sergey on 16.06.2022.
//

import UIKit

final class NewInvestigationsView: BaseView {
    private enum Constants {
        static let flowLayoutMinimumInteritemSpacing = CGFloat(16)
        static let flowLayoutMinimumLineSpacing = CGFloat(16)
    }
    
    private enum Constraints {
        static let collectionViewTopOffset = 8
    }
    
    private enum Text {
        static let titleText = "New investigation"
    }

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Text.titleText
        label.font = AppFonts.semiBold16.font
        label.textColor = AppColors.brightGrayTextColor.value
        label.textAlignment = .left
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = Constants.flowLayoutMinimumInteritemSpacing
        flowLayout.minimumLineSpacing = Constants.flowLayoutMinimumLineSpacing
        
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        self.collectionViewDataSource = CollectionViewDataSource<NewInvestigationViewCollectionCell>()
        self.collectionViewDelegate = CollectionViewDelegate()
        collectionView.delegate = self.collectionViewDelegate
        collectionView.dataSource = self.collectionViewDataSource
        collectionView.register(NewInvestigationViewCollectionCell.self,
                                forCellWithReuseIdentifier: NewInvestigationViewCollectionCell.identifier)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private var collectionViewDataSource: CollectionViewDataSource<NewInvestigationViewCollectionCell>?
    private var collectionViewDelegate: CollectionViewDelegate?

    override init() {
        super.init()
        self.setupLayout()
    }
        
    func setData(with vmList: [NewInvestigationViewModel]) {
        self.collectionViewDataSource?.items = vmList
        self.collectionView.reloadData()
    }
}

private extension NewInvestigationsView {
    func setupLayout() {
        setupTitleLabelLayout()
        setupCollectionViewLayout()
    }
    
    func setupTitleLabelLayout() {
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
    }
    
    func setupCollectionViewLayout() {
        self.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(Constraints.collectionViewTopOffset)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}


