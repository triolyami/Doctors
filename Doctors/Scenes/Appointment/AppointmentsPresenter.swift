//
//  AppointmentsPresenter.swift
//  Doctors
//
//  Created by Sergey on 22.06.2022.
//

import Foundation

protocol IAppointmentsPresenter: AnyObject {
    func obtainedAppointments(appointments: [Appointment])
    func shouldDeletaRowAt(indexPath: IndexPath)
    func shouldInsertRowAt(model: Appointment, newIndexPath: IndexPath)
    func shouldUpdateTable(models: [Appointment])
    func shouldUpdateRowAt(model: Appointment, indexPath: IndexPath)
    func obtainedUpdatingObject(model: Appointment)
}

final class AppointmentsPresenter {
    private weak var vc: IAppointmentViewController?
}

extension AppointmentsPresenter: IAppointmentsPresenter {
    func shouldUpdateRowAt(model: Appointment, indexPath: IndexPath) {
        guard let appointmentViewModel = self.mapInAppointmentViewModel(appointment: model) else {
            return
        }
        self.vc?.updateRowAt(vm: appointmentViewModel, indexPath: indexPath)
    }
    
    func shouldUpdateTable(models: [Appointment]) {
        let appointmentViewModels = self.mapInAppointmentViewModels(appointments: models)
        self.vc?.updateTable(with: appointmentViewModels)
    }
    
    func shouldDeletaRowAt(indexPath: IndexPath) {
        self.vc?.deleteItemAtRow(indexPath: indexPath)
    }
    
    func shouldInsertRowAt(model: Appointment, newIndexPath: IndexPath) {
        guard let appointmentViewModel = self.mapInAppointmentViewModel(appointment: model) else {
            return
        }
        self.vc?.insertRowAt(vm: appointmentViewModel, indexPath: newIndexPath)
    }
    
    func obtainedAppointments(appointments: [Appointment]) {
        let appointmentViewModels = self.mapInAppointmentViewModels(appointments: appointments)
        self.vc?.setData(with: appointmentViewModels)
        
    }
    
    func obtainedUpdatingObject(model: Appointment) {
        vc?.showResheduleForm(model: model)
    }
}

//MARK: - For Assembler
extension AppointmentsPresenter {
    func setVc(with vc: IAppointmentViewController) {
        self.vc = vc
    }
}

private extension AppointmentsPresenter {
    func mapInAppointmentViewModels(appointments: [Appointment]) -> [AppointmentViewModel] {
        var appointmentViewModels = [AppointmentViewModel]()
        for appointment in appointments {
            guard let appointmentViewModel = self.mapInAppointmentViewModel(appointment: appointment) else {
                continue
            }

            appointmentViewModels.append(appointmentViewModel)
        }
        return appointmentViewModels
    }
    
    func mapInAppointmentViewModel(appointment: Appointment) -> AppointmentViewModel? {
        guard let strongId = appointment.id,
              let strongTime = appointment.date,
              let strongImageOfDoctor = appointment.imageOfDoctor else {
            return nil
        }
        let nameOfDoctor = appointment.nameOfDoctor
        let imageOfDoctor = strongImageOfDoctor
        let id = strongId
        let date = DateConverter.showAppointmentDate(strongTime)
        return AppointmentViewModel(id: id, nameOfDoctor: nameOfDoctor, imageOfDoctor: imageOfDoctor, time: date)

    }
}
