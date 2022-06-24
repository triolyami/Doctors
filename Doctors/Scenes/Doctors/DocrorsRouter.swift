//
//  DocrorsRouter.swift
//  Doctors
//
//  Created by Sergey on 21.06.2022.
//

import UIKit

protocol IDoctorsRouter: AnyObject {
    func showDoctorProfile(performer: DoctorsViewController, model: DoctorProfile)
    func showAppointments(performer: DoctorsViewController)
}

final class DoctorsRouter {
}

extension DoctorsRouter: IDoctorsRouter {
    func showAppointments(performer: DoctorsViewController) {
        performer.navigationController?.popViewController(animated: true)

    }
    
    func showDoctorProfile(performer: DoctorsViewController, model: DoctorProfile) {
        let doctorProfileViewController = DoctorProfileAssembler.build(with: model)
        performer.navigationController?.pushViewController(doctorProfileViewController, animated: true)
    }
}
