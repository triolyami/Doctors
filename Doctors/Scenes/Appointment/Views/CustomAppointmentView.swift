//
//  CustomAppointmentView.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import UIKit

final class CustomAppointmentView: BaseView {
    private enum Constraints {
        static let customNavigationBarTopOffset = 16
        static let horizontalInset = 16
        
        static let reminderViewTopOffset = 25
    }
    
    private let customNavigationBar = CustomRootNavigationBarView()
    
    private let reminderView = ReminderView()
    
    override init() {
        super.init()
        self.setupLayout()
        self.configureView()
    }
    
    func setCellButtonHandlers(handler: @escaping (TypeOfOperation?, UUID?) -> Void) {
        self.reminderView.setCellButtonHandlers(handler: handler)
    }
    
    func setAddButtonHandler(handler: @escaping () -> Void) {
        self.customNavigationBar.addButtonHandler = handler
    }
    
    func setData(with vm: [AppointmentViewModel]) {
        self.reminderView.setData(with: vm)
    }
    
    func deleteItemAtRow(indexPath: IndexPath) {
        self.reminderView.deleteItemAtRow(indexPath: indexPath)
    }
    
    func insertRowAt(vm: AppointmentViewModel, indexPath: IndexPath) {
        self.reminderView.insertRowAt(vm: vm, indexPath: indexPath)
    }
    
    func updateRowAt(vm: AppointmentViewModel, indexPath: IndexPath) {
        self.reminderView.updateRowAt(vm: vm, indexPath: indexPath)
    }
    
    func updateTable(with vmList: [AppointmentViewModel]) {
        self.reminderView.updateTable(with: vmList)
    }
}

private extension CustomAppointmentView {
    func configureView() {
        self.backgroundColor = AppColors.lightGray.value
    }
    
    func setupLayout() {
        self.setupCustomNavigationBarLayout()
        self.setupReminderViewLayout()
    }
    
    func setupCustomNavigationBarLayout() {
        self.addSubview(self.customNavigationBar)
        self.customNavigationBar.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(Constraints.customNavigationBarTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constraints.horizontalInset)
        }
    }
    
    func setupReminderViewLayout() {
        self.addSubview(self.reminderView)
        self.reminderView.snp.makeConstraints { make in
            make.top.equalTo(self.customNavigationBar.snp.bottom).offset(Constraints.reminderViewTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constraints.horizontalInset)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
