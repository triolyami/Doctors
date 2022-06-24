//
//  DoctorProfileAssembler.swift
//  Doctors
//
//  Created by Sergey on 22.06.2022.
//

import UIKit

enum DoctorProfileAssembler {
    static func build(with model: DoctorProfile) -> DoctorProfileViewController {
        let router = DoctorProfileRouter()
        let presenter = DoctorProfilePresenter()
        let interactor = DoctorProfileInteracor(presenter: presenter, doctor: model)
        let controller = DoctorProfileViewController(router: router, interactor: interactor)
        presenter.setVc(with: controller)
        return controller
    }
}

