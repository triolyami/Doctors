//
//  AppointmenViewController.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import UIKit

protocol IAppointmentViewController: AnyObject {
    func setData(with vm: [AppointmentViewModel])
    func deleteItemAtRow(indexPath: IndexPath)
    func updateTable(with vm: [AppointmentViewModel])
    func insertRowAt(vm: AppointmentViewModel, indexPath: IndexPath)
    func updateRowAt(vm: AppointmentViewModel, indexPath: IndexPath)
    func showResheduleForm(model: Appointment)
}

final class AppointmentViewController: BaseViewController {
    private let customAppointmentView = CustomAppointmentView()
    private let router: IAppointmentRouter
    private let interactor: IAppointmentsInteractor
    
    init(interactor: IAppointmentsInteractor, router: IAppointmentRouter) {
        self.interactor = interactor
        self.router = router
        super.init()
    }
    
    override func loadView() {
        self.view = self.customAppointmentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewHandlers()
        self.interactor.obtainAppointments()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}

extension AppointmentViewController: IAppointmentViewController {
    func updateRowAt(vm: AppointmentViewModel, indexPath: IndexPath) {
        self.customAppointmentView.updateRowAt(vm: vm, indexPath: indexPath)
    }
    
    func deleteItemAtRow(indexPath: IndexPath) {
        self.customAppointmentView.deleteItemAtRow(indexPath: indexPath)
    }
    
    func insertRowAt(vm: AppointmentViewModel, indexPath: IndexPath) {
        self.customAppointmentView.insertRowAt(vm: vm, indexPath: indexPath)
    }
    
    func updateTable(with vm: [AppointmentViewModel]) {
        self.customAppointmentView.updateTable(with: vm)
    }
    
    func setData(with vm: [AppointmentViewModel]) {
        self.customAppointmentView.setData(with: vm)
    }
    
    func showResheduleForm(model: Appointment) {
        self.router.showUpdateAppointment(performer: self, model: model)
    }
}

private extension AppointmentViewController {
    func setViewHandlers() {
        self.setCellButtonHandlers()
        self.setAddButtonHandler()
    }
    
    func setCellButtonHandlers() {
        self.customAppointmentView.setCellButtonHandlers { [weak self] typeOfOperation, id  in
            self?.interactor.changeAppointments(with: typeOfOperation, id: id)
        }
    }
    
    func setAddButtonHandler() {
        self.customAppointmentView.setAddButtonHandler { [weak self] in
            guard let self = self else {
                return
            }
            self.router.showDoctorsList(performer: self)
        }
    }
}
