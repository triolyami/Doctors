//
//  PickAppointmentDateViewConotrller.swift
//  Doctors
//
//  Created by Sergey on 22.06.2022.
//
import UIKit

protocol INewAppointmentViewController: AnyObject {
    func showDoctor(with vm: DoctorProfileViewModel)
    func showIncorrectDateMessage()
}

final class NewAppointmentViewController: BaseViewController {
    private let customView = CustomNewAppointmentView()
    private let interactor: INewAppointmentInteractor
    private let router: INewAppointmentRouter
    
    init(interactor: INewAppointmentInteractor, router: INewAppointmentRouter) {
        self.interactor = interactor
        self.router = router
        super.init()
    }
    
    override func loadView() {
        self.view = self.customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewHandlers()
        self.interactor.obtainDoctor()
    }
}

extension NewAppointmentViewController: INewAppointmentViewController {
    func showIncorrectDateMessage() {
        self.router.showIncorrectDateMessage(performer: self)
    }
    
    func showDoctor(with vm: DoctorProfileViewModel) {
        self.customView.setData(with: vm)
    }
}

private extension NewAppointmentViewController {
    func setViewHandlers() {
        self.setTakeTimeButtonHandler()
        self.setBackButtonHandler()
    }
    
    func setTakeTimeButtonHandler() {
        customView.takeThisTimeButtonHandler = { [weak self] date in
            guard let self = self else {
                return
            }
            self.interactor.createNewAppointment(with: date)
            self.router.showAppointments(performer: self)
        }
    }
    
    func setBackButtonHandler() {
        customView.setBackButtonHandler { [weak self] in
            guard let self = self else {
                return
            }
            self.router.showDoctorProfile(performer: self)
        }
    }
}
