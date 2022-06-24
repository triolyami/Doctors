//
//  DoctorProfileViewController.swift
//  Doctors
//
//  Created by Sergey on 21.06.2022.
//

import UIKit

protocol IDoctorProfileViewController: AnyObject {
    func setData(with vm: DoctorProfileViewModel)
    func showNewAppointment(with model: DoctorProfile)
}

final class DoctorProfileViewController: BaseViewController {
    
    private let customView = CustomDoctorProfileView()
    private let router: IDoctorProfileRouter
    private let interactor: IDoctorProfileInteracor
    
    init(router: IDoctorProfileRouter, interactor: IDoctorProfileInteracor) {
        self.router = router
        self.interactor = interactor
        super.init()
    }
    
    override func loadView() {
        self.view = self.customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewHandlers()
        self.interactor.obtainDoctorProfile()
    }
}

extension DoctorProfileViewController: IDoctorProfileViewController {
    func showNewAppointment(with model: DoctorProfile) {
        self.router.showCreateNewAppointment(performer: self, model: model)
    }
    
    func setData(with vm: DoctorProfileViewModel) {
        self.customView.setData(with: vm)
    }
}

private extension DoctorProfileViewController {
    func setViewHandlers() {
        self.setBackButtonhandler()
        self.setMakeAnAppointmentHandler()
    }
    
    func setBackButtonhandler() {
        self.customView.setButtonBackHandler { [weak self] in
            guard let self = self else {
                return
            }
            self.router.showDoctors(performer: self)
        }
    }
    
    func setMakeAnAppointmentHandler() {
        self.customView.makeAnAppointmentButtonhandler = { [weak self] in
            self?.interactor.obtainDoctorForNewAppointment()
        }
    }
}

