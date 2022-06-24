//
//  AppointmentsRouter.swift
//  Doctors
//
//  Created by Sergey on 20.06.2022.
//

import UIKit

enum AppointmentsAssembler {
    static func buildWithnavigationController() -> UINavigationController {
        let navController = UINavigationController(rootViewController: Self.build())
        navController.isNavigationBarHidden = true
        return navController
    }
}

private extension AppointmentsAssembler {
    static private func build() -> AppointmentViewController {
        let router = AppointmentRouter()
        let presenter = AppointmentsPresenter()
        let interactor = AppointmentsInteractor(presenter: presenter)
        let controller = AppointmentViewController(interactor: interactor, router: router)
        presenter.setVc(with: controller)
        return controller
    }
}
