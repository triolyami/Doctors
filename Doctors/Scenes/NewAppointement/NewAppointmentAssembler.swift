//
//  NewAppointmentAssembler.swift
//  Doctors
//
//  Created by Sergey on 22.06.2022.
//

import Foundation

enum NewAppointmetnAssembler {
    static func build(with model: DoctorProfile) -> NewAppointmentViewController {
        let router = NewAppointmentRouter()
        let presenter = NewAppointmentPresenter()
        let interactor = NewAppointmentInteractor(presenter: presenter, model: model)
        let controller = NewAppointmentViewController(interactor: interactor, router: router)
        presenter.setVc(with: controller)
        return controller
    }
}
