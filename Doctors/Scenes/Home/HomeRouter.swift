//
//  HomeRouter.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import UIKit

protocol IHomeRouter: AnyObject {
    func showErrorAllert(performer: HomeViewController, text: String)
}

final class HomeRouter {
    private enum Texts {
        static let errorAlertTitle = "Error"
        static let incorrectTownAlertTitle = "Something went wrong"
    }
}

extension HomeRouter: IHomeRouter {
    func showErrorAllert(performer: HomeViewController, text: String) {
        let alertController = UIAlertController(title: Texts.errorAlertTitle, message: text, preferredStyle: .alert)
        performer.present(alertController, animated: true)
    }
}
