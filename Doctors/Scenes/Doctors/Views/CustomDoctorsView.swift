//
//  CustomDoctorsListView.swift
//  Doctors
//
//  Created by Sergey on 20.06.2022.
//

import UIKit

final class CustomDoctorsView: BaseView {
    private enum Constants {
        static let collectionViewMinimumInteritemSpacing = CGFloat(16)
        static let collectionViewMinimumLineSpacing = CGFloat(16)
    }
    
    private enum Texts {
        static let navBarTitle = "Add"
    }
    
    private enum Constraints {
        static let navBarTopOffset = 8
        static let horizontalnset = 16
        
        static let searchTextFieldTopOffset = 8
        static let searchTextFieldHeight = 48
        
        static let collectionViewTopOffset = 16
    }
    
    private let navBar = NavigationBarWithBackButtonView(title: Texts.navBarTitle)
    
    private let searchTextField = CustomTextField(borderColor: AppColors.white.cgColor)
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = Constants.collectionViewMinimumInteritemSpacing
        flowLayout.minimumLineSpacing = Constants.collectionViewMinimumLineSpacing
        
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        self.collectionViewDataSource = CollectionViewDataSource<DoctorCollectionViewCell>()
        self.collectionViewDelegate = CollectionViewDelegate()
        collectionView.delegate = self.collectionViewDelegate
        collectionView.dataSource = self.collectionViewDataSource
        collectionView.register(DoctorCollectionViewCell.self,
                                forCellWithReuseIdentifier: DoctorCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private var collectionViewDataSource: CollectionViewDataSource<DoctorCollectionViewCell>?
    private var collectionViewDelegate: CollectionViewDelegate?

    override init() {
        super.init()
        self.setupLayout()
        self.configureView()
    }
    
    func setButtonBackHandler(handler: @escaping () -> Void) {
        self.navBar.setBackButtonHandler(handler: handler)
    }
    
    func setCollectionViewDelegateHandler(handler: @escaping (IndexPath) -> Void) {
        self.collectionViewDelegate?.didSelectRowHandler = handler
    }
    
    func setData(with vm: [DoctorViewModel]) {
        self.collectionViewDataSource?.items = vm
        self.collectionView.reloadData()
    }
}

private extension CustomDoctorsView {
    func configureView() {
        self.backgroundColor = AppColors.lightGray.value
    }
    
    func setupLayout() {
        self.setupNavBarLayout()
        self.setupSearchTextFieldLayout()
        self.setupCollectionViewLayout()
    }
    
    func setupNavBarLayout() {
        self.addSubview(self.navBar)
        self.navBar.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(Constraints.navBarTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constraints.horizontalnset)
        }
    }
    
    func setupSearchTextFieldLayout() {
        self.addSubview(self.searchTextField)
        self.searchTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Constraints.horizontalnset)
            make.top.equalTo(self.navBar.snp.bottom).offset(Constraints.searchTextFieldTopOffset)
            make.height.equalTo(Constraints.searchTextFieldHeight)
        }
    }
    
    func setupCollectionViewLayout() {
        self.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.searchTextField.snp.bottom).offset(Constraints.collectionViewTopOffset)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}


