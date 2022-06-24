//
//  NewAppointmentInteractor.swift
//  Doctors
//
//  Created by Sergey on 22.06.2022.
//

import Foundation

protocol INewAppointmentInteractor: AnyObject {
    func obtainDoctor()
    func createNewAppointment(with date: Date)
}

final class NewAppointmentInteractor {
    private let presenter: INewAppointmentPresenter
    private let doctorProfile: DoctorProfile
    
    private let datamanager = DataManager.shared
    
    init(presenter: INewAppointmentPresenter, model: DoctorProfile) {
        self.presenter = presenter
        self.doctorProfile = model
    }
}

extension NewAppointmentInteractor: INewAppointmentInteractor {
    func createNewAppointment(with date: Date) {
        if date >= Date() {
            self.datamanager.createAppointment(doctor: self.doctorProfile, date: date)
        } else {
            self.presenter.incorrectDate()
        }
    }
    
    func obtainDoctor() {
        self.presenter.obtainedDoctor(doctor: self.doctorProfile)
    }
    
}

