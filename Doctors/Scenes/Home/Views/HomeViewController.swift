//
//  HomeViewController.swift
//  Doctors
//
//  Created by Sergey on 16.06.2022.
//
import UIKit

protocol IHomeViewController: AnyObject {
    func showError(message: String)
    func setNewInvestigation(with vmList: [NewInvestigationViewModel])
    func setSymptoms(with vmList: [SymptomViewModel])

}

final class HomeViewController: BaseViewController {
    
    private let customHomeView = CustomHomeView()
    private let interactror: IHomeInteractor
    private let router: IHomeRouter
    
    init(interactor: IHomeInteractor, router: IHomeRouter) {
        self.interactror = interactor
        self.router = router
        super.init()
    }
    
    override func loadView() {
        self.view = customHomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactror.obtainData()
    }    
}

extension HomeViewController: IHomeViewController {
    func setSymptoms(with vmList: [SymptomViewModel]) {
        self.customHomeView.setSymptoms(with: vmList)
    }
        
    func showError(message: String) {
        self.router.showErrorAllert(performer: self, text: message)
    }
    
    func setNewInvestigation(with vmList: [NewInvestigationViewModel]) {
        self.customHomeView.setNewInvestigations(with: vmList)
    }
}
