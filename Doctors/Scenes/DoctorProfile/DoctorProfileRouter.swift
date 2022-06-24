//
//  DoctorProfileRouter.swift
//  Doctors
//
//  Created by Sergey on 22.06.2022.
//

import UIKit

protocol IDoctorProfileRouter: AnyObject {
    func showCreateNewAppointment(performer: DoctorProfileViewController, model: DoctorProfile)
    func showDoctors(performer: DoctorProfileViewController)
}

final class DoctorProfileRouter {
    
}

extension DoctorProfileRouter: IDoctorProfileRouter {
    func showCreateNewAppointment(performer: DoctorProfileViewController, model: DoctorProfile) {
        let newAppointmentViewController = NewAppointmetnAssembler.build(with: model)
        performer.navigationController?.pushViewController(newAppointmentViewController, animated: true)
    }
    
    func showDoctors(performer: DoctorProfileViewController) {
        performer.navigationController?.popViewController(animated: true)
    }
}

