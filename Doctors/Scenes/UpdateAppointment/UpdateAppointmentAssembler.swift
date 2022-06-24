//
//  UpdateAppointmentAssembler.swift
//  Doctors
//
//  Created by Sergey on 23.06.2022.
//

import Foundation

enum UpdateAppointmentAssembler {
    static func build(with model: Appointment) -> UpdateAppointmentViewController {
        let router = UpdateAppointmentRouter()
        let presenter = UpdateAppointmentPresenter()
        let interactor = UpdateAppointmentInteractor(presenter: presenter, appointment: model)
        let controller = UpdateAppointmentViewController(router: router, interactor: interactor)
        presenter.setVc(with: controller)
        return controller
    }
}
