//
//  UpdateAppointmentViewController.swift
//  Doctors
//
//  Created by Sergey on 23.06.2022.
//

import UIKit

protocol IUpdateAppointmentViewController: AnyObject {
    func setData(with date: Date)
    func updateHasBeenDone()
}

final class UpdateAppointmentViewController: BaseViewController {
    private let customView = CustomUpdateAppointmentView()
    
    private let router: IUpdateAppointmentRouter
    private let interactor: IUpdateAppointmentInteractor
    
    init(router: IUpdateAppointmentRouter, interactor: IUpdateAppointmentInteractor) {
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
        self.interactor.obtainAppointmentDate()
    }
    
}

extension UpdateAppointmentViewController: IUpdateAppointmentViewController {
    func updateHasBeenDone() {
        self.router.dismiss(performer: self)
    }
    
    
    func setData(with date: Date) {
        self.customView.setData(with: date)
        print(date)
    }
}

private extension UpdateAppointmentViewController {
    func setViewHandlers() {
        self.customView.resheduleButtonhHandler = { [weak self] date in
            self?.interactor.updateAppointment(with: date)
        }
    }
}
