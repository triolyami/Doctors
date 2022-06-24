//
//  DoctorsAssembler.swift
//  Doctors
//
//  Created by Sergey on 21.06.2022.
//

import Foundation

enum DoctorsAssembler {
    static func build() -> DoctorsViewController {
        let presenter = DoctorsPresenter()
        let router = DoctorsRouter()
        let interactor = DoctorsInteractor(presenter: presenter)
        let controller = DoctorsViewController(interactor: interactor, router: router)
        presenter.setVc(with: controller)
        return controller
    }
}
