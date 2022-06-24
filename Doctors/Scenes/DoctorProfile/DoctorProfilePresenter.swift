//
//  DoctorProfilePresenter.swift
//  Doctors
//
//  Created by Sergey on 21.06.2022.
//

import Foundation

protocol IDoctorProfilePresenter: AnyObject {
    func obtainedDoctorProfile(_ doctorProfile: DoctorProfile)
    func obtainedError(message: String)
    func obtainedDoctorForNewAppointment(doctor: DoctorProfile)
}

final class DoctorProfilePresenter {
    private weak var vc: IDoctorProfileViewController?
}

extension DoctorProfilePresenter: IDoctorProfilePresenter {
    func obtainedDoctorForNewAppointment(doctor: DoctorProfile) {
   //     let doctorProfileViewModel = self.mapInDoctorProfileViewModel(model: doctor)
        self.vc?.showNewAppointment(with: doctor)
    }
    
    func obtainedError(message: String) {
        print(message)
    }
    
    func obtainedDoctorProfile(_ doctorProfile: DoctorProfile) {
        let doctorProfileViewModel = self.mapInDoctorProfileViewModel(model: doctorProfile)
        self.vc?.setData(with: doctorProfileViewModel)
    }
    
}

//MARK: - For Assembler
extension DoctorProfilePresenter {
    func setVc(with vc: IDoctorProfileViewController) {
        self.vc = vc
    }
}

private extension DoctorProfilePresenter {
    func mapInDoctorProfileViewModel(model: DoctorProfile) -> DoctorProfileViewModel {
        let name = model.name
        let image = model.image
        return DoctorProfileViewModel(image: image, name: name)
    }
}
