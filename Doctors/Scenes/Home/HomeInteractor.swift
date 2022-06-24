//
//  HomeInteractor.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import Foundation

protocol IHomeInteractor: AnyObject {
    func obtainData()
}

final class HomeInteractor {
    private let presenter: IHomePresenter
    
    private let loadNewInvestigationsWorker: ILoadNewInvestigationsWorker = LoadNewInvestigationsWorker(service: NetworkService())
    private let loadImagesWorker: ILoadImageWorker = LoadImageWorker(service: NetworkService())
    private let loadSymptomsWorker: ILoadSymptomsWorker = LoadSymptomsWorker()
    
    private lazy var loadNewInvestigationsDataUseCase: ILoadNewInvestigationsUseCase = LoadNewInvestigationsUseCase(worker: self.loadNewInvestigationsWorker)
    private lazy var loadNewInvestigationImagesUseCase: ILoadImagesUseCase = LoadImagesUseCase(worker: self.loadImagesWorker)
    private lazy var loadSymptomsUseCase: ILoadSymptomsUseCase = LoadSymptomsUseCase(worker: self.loadSymptomsWorker)
    
    private var newInvestigations = [NewInvestigation]()
    
    init(presenter: IHomePresenter) {
        self.presenter = presenter
    }
}

extension HomeInteractor: IHomeInteractor {
    func obtainData() {
        self.obtainNewInvestigations()
        self.obtainSymptoms()
    }
}

private extension HomeInteractor {
    func obtainNewInvestigations() {
        self.loadNewInvestigationsDataUseCase.load { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let data):
                print(data.count)
                self.newInvestigations = data
                self.fetchImages(for: data)
            case .failure(let error):
                self.presenter.obtainedError(messege: error.localizedDescription)
            }
        }
    }
    
    func obtainSymptoms() {
        let symptoms = self.loadSymptomsUseCase.load()
        self.presenter.obtainedSymptoms(models: symptoms)
    }
    
    func fetchImages(for models: [NewInvestigation]) {
        self.loadNewInvestigationImagesUseCase.load(models: models) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let data):
                print(data.count)
                self.presenter.obtainedNewInvestigations(models: self.newInvestigations, images: data)
            case .failure(let error):
                self.presenter.obtainedError(messege: error.localizedDescription)
            }
        }
    }
}
