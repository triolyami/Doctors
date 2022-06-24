//
//  HomeAssembler.swift
//  Doctors
//
//  Created by Sergey on 16.06.2022.
//

import UIKit

enum HomeAssembler {
    static func build() -> HomeViewController {
        let presenter = HomePresenter()
        let interactor = HomeInteractor(presenter: presenter)
        let router = HomeRouter()
        let viewController = HomeViewController(interactor: interactor, router: router)
        presenter.setVc(with: viewController)
        return viewController
    }
}
