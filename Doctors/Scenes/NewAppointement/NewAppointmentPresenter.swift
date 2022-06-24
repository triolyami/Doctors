//
//  NewAppointmentPresenter.swift
//  Doctors
//
//  Created by Sergey on 22.06.2022.
//

import Foundation

protocol INewAppointmentPresenter: AnyObject {
    func obtainedDoctor(doctor: DoctorProfile)
    func incorrectDate()
}

final class NewAppointmentPresenter {
    private weak var vc: INewAppointmentViewController?
    
}

extension NewAppointmentPresenter: INewAppointmentPresenter {
    func obtainedDoctor(doctor: DoctorProfile) {
        let doctorProfileViewModel = self.mapInDoctorProfileViewModel(model: doctor)
        self.vc?.showDoctor(with: doctorProfileViewModel)
    }
    
    func incorrectDate() {
        self.vc?.showIncorrectDateMessage()
    }
}

//MARK: - For Assembler
extension NewAppointmentPresenter {
    func setVc(with vc: INewAppointmentViewController) {
        self.vc = vc
    }
}

private extension NewAppointmentPresenter {
    func mapInDoctorProfileViewModel(model: DoctorProfile) -> DoctorProfileViewModel {
        let name = model.name
        let image = model.image
        return DoctorProfileViewModel(image: image, name: name)
    }
}


