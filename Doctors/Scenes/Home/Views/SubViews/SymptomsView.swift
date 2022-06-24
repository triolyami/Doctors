//
//  SymptomsView.swift
//  Doctors
//
//  Created by Sergey on 16.06.2022.
//

import UIKit

final class SymptomsView: BaseView {
    
    private enum Texts {
        static let symptomsLabelText = "Your symptoms"
    }
    
    private var symptomsLabel: UILabel = {
        let label = UILabel()
        label.text = Texts.symptomsLabelText
        label.font = AppFonts.semiBold16.font
        label.textColor = AppColors.brightGrayTextColor.value
        label.textAlignment = .left
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        self.collectionViewDataSource = CollectionViewDataSource<SymptomsCollectionViewCell>()
        collectionView.dataSource = self.collectionViewDataSource
        collectionView.register(SymptomsCollectionViewCell.self,
                                forCellWithReuseIdentifier: SymptomsCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        

        return collectionView
    }()
    
    private var collectionViewDataSource: CollectionViewDataSource<SymptomsCollectionViewCell>?
    
    override init() {
        super.init()
        self.setupLayout()
    }
    
    func setData(with vmList: [SymptomViewModel]) {
        self.collectionViewDataSource?.items = vmList
        self.collectionView.reloadData()
    }
}


private extension SymptomsView {
    func setupLayout() {
        setupSymptomLabelLayout()
        setupCollectionViewLayout()
    }
    
    func setupSymptomLabelLayout() {
        self.addSubview(self.symptomsLabel)
        self.symptomsLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
    }
    
    func setupCollectionViewLayout() {
        self.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.symptomsLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(48)
            make.bottom.equalToSuperview()
        }
    }
}
