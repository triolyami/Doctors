//
//  NewAppointmentRouter.swift
//  Doctors
//
//  Created by Sergey on 22.06.2022.
//

import UIKit

protocol INewAppointmentRouter: AnyObject {
    func showIncorrectDateMessage(performer: NewAppointmentViewController)
    func showDoctorProfile(performer: NewAppointmentViewController)
    func showAppointments(performer: NewAppointmentViewController)
}

final class NewAppointmentRouter {
    private enum Texts {
        static let incorrectDateAlerTitle = "Incorrect Date"
        static let incorrectDateAlerMessage = "Please, choose correct date"
        static let buttonOkTitle = "Ok"
    }
}

extension NewAppointmentRouter: INewAppointmentRouter {
    func showAppointments(performer: NewAppointmentViewController) {
        performer.navigationController?.popToRootViewController(animated: true)
    }
    
    func showDoctorProfile(performer: NewAppointmentViewController) {
        performer.navigationController?.popViewController(animated: true)
    }
    
    func showIncorrectDateMessage(performer: NewAppointmentViewController) {
        let alertController = UIAlertController(title: Texts.incorrectDateAlerTitle, message: Texts.incorrectDateAlerMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: Texts.buttonOkTitle, style: .default)
        alertController.addAction(action)
        performer.present(alertController, animated: true)
    }
}
