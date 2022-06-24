//
//  AppointmentRouter.swift
//  Doctors
//
//  Created by Sergey on 20.06.2022.
//

import UIKit

protocol IAppointmentRouter: AnyObject {
    func showDoctorsList(performer: AppointmentViewController)
    func showUpdateAppointment(performer: AppointmentViewController, model: Appointment)
}

final class AppointmentRouter {
    
}

extension AppointmentRouter: IAppointmentRouter {
    func showUpdateAppointment(performer: AppointmentViewController, model: Appointment) {
        let updateAppointmentViewController = UpdateAppointmentAssembler.build(with: model)
        performer.present(updateAppointmentViewController, animated: true)
    }
    
    func showDoctorsList(performer: AppointmentViewController) {
        let doctorsListVc = DoctorsAssembler.build()
        performer.navigationController?.pushViewController(doctorsListVc, animated: true)
    }
}
