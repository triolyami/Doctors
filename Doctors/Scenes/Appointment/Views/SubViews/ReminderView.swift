//
//  ReminderView.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import UIKit

final class ReminderView: BaseView {
    private enum Constants {
        static let flowLayoutMinimumInteritemSpacing = CGFloat(16)
        static let flowLayoutMinimumLineSpacing = CGFloat(16)
    }
    
    private enum Constraints {
        static let commonTopOffset = 10
    }
    
    private enum Texts {
        static let titleLabelText = "Reminder"
        static let remindeLabelText = "Dont forget schedule upcoming appiontment"
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Texts.titleLabelText
        label.textAlignment = .left
        label.font = AppFonts.semiBold16.font
        return label
    }()
    
    private let remindeLabel: UILabel = {
        let label = UILabel()
        label.text = Texts.remindeLabelText
        label.textAlignment = .left
        label.font = AppFonts.regular12.font
        label.textColor = AppColors.brightGrayTextColor.value
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = Constants.flowLayoutMinimumInteritemSpacing
        flowLayout.minimumLineSpacing = Constants.flowLayoutMinimumLineSpacing
        
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        self.appointmentCollectionViewDataSource = AppointmentCollectionViewDataSource()
        self.appointmentCollectionViewDelegate = AppointmentsCollectionViewDelegate()
        collectionView.delegate = self.appointmentCollectionViewDelegate
        collectionView.dataSource = self.appointmentCollectionViewDataSource
        collectionView.register(AppointmentCollectionViewCell.self,
                                forCellWithReuseIdentifier: AppointmentCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    var appointmentCollectionViewDataSource: IAppointmentCollectionViewDataSource?
    var appointmentCollectionViewDelegate: AppointmentsCollectionViewDelegate?
    
    override init() {
        super.init()
        self.setupLayout()
    }
    
    func setCellButtonHandlers(handler: @escaping (TypeOfOperation?, UUID?) -> Void) {
        self.appointmentCollectionViewDataSource?.cellButtonsHandler = handler
    }
    
    func setData(with vm: [AppointmentViewModel]) {
        self.appointmentCollectionViewDataSource?.items = vm
        self.collectionView.reloadData()
    }
    
    func deleteItemAtRow(indexPath: IndexPath) {
        self.appointmentCollectionViewDataSource?.deleteItemAtRow(indexPath: indexPath)
        self.collectionView.deleteItems(at: [indexPath])
    }
    
    func insertRowAt(vm: AppointmentViewModel, indexPath: IndexPath) {
        self.appointmentCollectionViewDataSource?.insertRowAt(vm: vm, indexPath: indexPath)
        self.collectionView.insertItems(at: [indexPath])
    }
    
    func updateRowAt(vm: AppointmentViewModel, indexPath: IndexPath) {
        self.appointmentCollectionViewDataSource?.updateRowAt(vm: vm, indexPath: indexPath)
        self.collectionView.reloadItems(at: [indexPath])
    }
    
    func updateTable(with vmList: [AppointmentViewModel]) {
        self.appointmentCollectionViewDataSource?.updateRows(with: vmList)
        self.collectionView.reloadData()
    }
}

private extension ReminderView {
    func setupLayout() {
        self.setupTitleLabelLayout()
        self.setupRemindeLabelLayout()
        self.setupCollectionViewLayout()
    }
    
    func setupTitleLabelLayout() {
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
    }
    
    func setupRemindeLabelLayout() {
        self.addSubview(self.remindeLabel)
        self.remindeLabel.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(Constraints.commonTopOffset)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func setupCollectionViewLayout() {
        self.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.remindeLabel.snp.bottom).offset(Constraints.commonTopOffset)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
