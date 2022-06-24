//
//  UpdateAppointmentInteractor.swift
//  Doctors
//
//  Created by Sergey on 23.06.2022.
//

import Foundation

protocol IUpdateAppointmentInteractor: AnyObject {
    func obtainAppointmentDate()
    func updateAppointment(with date: Date)
}

final class UpdateAppointmentInteractor {
    private let presenter: IUpdateAppointmentPresenter
    private let appointment: Appointment
    private let dataManager = DataManager.shared
    
    init(presenter: IUpdateAppointmentPresenter, appointment: Appointment) {
        self.presenter = presenter
        self.appointment = appointment
    }
}

extension UpdateAppointmentInteractor: IUpdateAppointmentInteractor {
    func obtainAppointmentDate() {
        guard let date = self.appointment.date else {
            return
        }
        self.presenter.obtainedAppointmentDate(date)
    }
    
    func updateAppointment(with date: Date) {
        dataManager.updateAppointment(with: appointment.id, date: date)
        self.presenter.updateHasBeenDone()
    }

}
