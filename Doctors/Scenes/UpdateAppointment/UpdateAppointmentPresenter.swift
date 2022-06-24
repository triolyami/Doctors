//
//  UpdateAppointmentPresenter.swift
//  Doctors
//
//  Created by Sergey on 23.06.2022.
//

import Foundation

protocol IUpdateAppointmentPresenter: AnyObject {
    func obtainedAppointmentDate(_ date: Date)
    func updateHasBeenDone()
}

final class UpdateAppointmentPresenter {
    private weak var vc: IUpdateAppointmentViewController?
}

extension UpdateAppointmentPresenter: IUpdateAppointmentPresenter {
    func updateHasBeenDone() {
        self.vc?.updateHasBeenDone()
    }
    
    func obtainedAppointmentDate(_ date: Date) {
        self.vc?.setData(with: date)
    }
    
}

//MARK: - For Assembler
extension UpdateAppointmentPresenter {
    func setVc(with vc: IUpdateAppointmentViewController) {
        self.vc = vc
    }
}

