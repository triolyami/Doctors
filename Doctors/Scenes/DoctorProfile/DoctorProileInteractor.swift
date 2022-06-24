//
//  DoctorProileInteractor.swift
//  Doctors
//
//  Created by Sergey on 21.06.2022.
//

import Foundation

protocol IDoctorProfileInteracor: AnyObject {
    func obtainDoctorProfile()
    func obtainDoctorForNewAppointment()

}

final class DoctorProfileInteracor {
    
    private let presenter: IDoctorProfilePresenter
        
    private let doctorProfile: DoctorProfile
    
    init(presenter: IDoctorProfilePresenter, doctor: DoctorProfile) {
        self.presenter = presenter
        self.doctorProfile = doctor
    }
}

extension DoctorProfileInteracor: IDoctorProfileInteracor {
    func obtainDoctorForNewAppointment() {
        self.presenter.obtainedDoctorForNewAppointment(doctor: self.doctorProfile)
    }
    
    func obtainDoctorProfile() {
        self.presenter.obtainedDoctorProfile(self.doctorProfile)
    }
}
