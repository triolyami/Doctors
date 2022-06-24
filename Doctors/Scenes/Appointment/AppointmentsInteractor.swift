//
//  AppointmentsInteractor.swift
//  Doctors
//
//  Created by Sergey on 22.06.2022.
//

import Foundation

protocol IAppointmentsInteractor: AnyObject {
    func obtainAppointments()
    func changeAppointments(with typeOfOperation: TypeOfOperation?, id: UUID?)
}

final class AppointmentsInteractor {
    
    private let presenter: IAppointmentsPresenter
    private let dataManager = DataManager.shared
    
    init(presenter: IAppointmentsPresenter) {
        self.presenter = presenter
        self.dataManager.delegate = self
    }
}

extension AppointmentsInteractor: IAppointmentsInteractor {
    func changeAppointments(with typeOfOperation: TypeOfOperation?, id: UUID?) {
        guard let typeOfOperation = typeOfOperation else {
            return
        }
        switch typeOfOperation {
        case .cancel:
            self.dataManager.deleteAppointment(with: id)
            print("deleted")
        case .reshedule: 
            guard let updatedObject = self.dataManager.getObjectWithId(id) else {
                return
            }
            self.presenter.obtainedUpdatingObject(model: updatedObject)
        }
    }
    
    func obtainAppointments() {
        let appointments = self.dataManager.objects()
        self.presenter.obtainedAppointments(appointments: appointments)
    }
}

extension AppointmentsInteractor: DataManagerDelegate {
    func shoultUpdateRowAt(model: Appointment, indexPath: IndexPath) {
        self.presenter.shouldUpdateRowAt(model: model, indexPath: indexPath)
    }
    
    func shouldUpdateTable(models: [Appointment]) {
        self.presenter.shouldUpdateTable(models: models)
    }
    
    func shouldDeletaRowAt(indexPath: IndexPath) {
        presenter.shouldDeletaRowAt(indexPath: indexPath)
    }
    
    func shouldInsertRowAt(model: Appointment, newIndexPath: IndexPath) {
        presenter.shouldInsertRowAt(model: model, newIndexPath: newIndexPath)
    }
}

