//
//  UpdateAppointmentRouter.swift
//  Doctors
//
//  Created by Sergey on 23.06.2022.
//

import Foundation

protocol IUpdateAppointmentRouter: AnyObject {
    func dismiss(performer: UpdateAppointmentViewController)

}

final class UpdateAppointmentRouter: IUpdateAppointmentRouter {
    func dismiss(performer: UpdateAppointmentViewController) {
        performer.dismiss(animated: true)
    }
}
