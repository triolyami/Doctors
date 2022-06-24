//
//  DoctorsListViewController.swift
//  Doctors
//
//  Created by Sergey on 20.06.2022.
//

import UIKit

protocol IDoctorsViewController: AnyObject {
    func showError(message: String)
    func setupData(with vmList: [DoctorViewModel])
    func showCurrenDoctorProfile(with doctor: DoctorProfile)
}

final class DoctorsViewController: BaseViewController {
    
    private let customDoctorsListView = CustomDoctorsView()
    
    private let interactor: IDoctorsInteractor
    private let router: IDoctorsRouter
    
    init(interactor: IDoctorsInteractor, router: IDoctorsRouter) {
        self.interactor = interactor
        self.router = router
        super.init()
    }
    
    override func loadView() {
        self.view = self.customDoctorsListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewHandlers()
        self.interactor.obtainDoctors()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
}

extension DoctorsViewController: IDoctorsViewController {
    
    func showError(message: String) {
        print(message)
    }
    
    func setupData(with vmList: [DoctorViewModel]) {
        self.customDoctorsListView.setData(with: vmList)
    }
    
    func showCurrenDoctorProfile(with doctor: DoctorProfile) {
        self.router.showDoctorProfile(performer: self, model: doctor)
    }
}

private extension DoctorsViewController {
    func setViewHandlers() {
        self.setBackButtonHandler()
        self.setCollectionViewHandler()
    }
    
    func setBackButtonHandler() {
        self.customDoctorsListView.setButtonBackHandler { [weak self] in
            guard let self = self else {
                return
            }
            self.router.showAppointments(performer: self)
        }
    }
    
    func setCollectionViewHandler() {
        self.customDoctorsListView.setCollectionViewDelegateHandler { [weak self] indexPath in
            self?.interactor.obtainCurrentDoctor(with: indexPath)
        }
    }
}
