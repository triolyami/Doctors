//
//  DoctorsInteractor.swift
//  Doctors
//
//  Created by Sergey on 21.06.2022.
//

import Foundation

protocol IDoctorsInteractor: AnyObject {
    func obtainDoctors()
    func obtainCurrentDoctor(with indexPath: IndexPath)
}

final class DoctorsInteractor {
    private let presenter: IDoctorsPresenter
    
    
    private let loadDoctorsWorker: ILoadDoctorsWorker = LoadDoctorsWorker(service: NetworkService())
    private let loadImageWorker: ILoadImageWorker = LoadImageWorker(service: NetworkService())
    
    private lazy var loadDoctorsUseCase: ILoadDoctorsUseCase = LoadDoctorsUseCase(worker: self.loadDoctorsWorker)
    private lazy var loadDoctorsImagesUseCase: ILoadImagesUseCase = LoadImagesUseCase(worker: self.loadImageWorker)
    private lazy var loadSingleDoctorImageuseCase: ILoadSingleImageUseCase = LoadSingleImageUseCase(worker: self.loadImageWorker)
    
    private var doctors = [Doctor]()
    

    init(presenter: IDoctorsPresenter) {
        self.presenter = presenter
    }
}

extension DoctorsInteractor: IDoctorsInteractor {
    func obtainDoctors() {
        self.loadDoctorsUseCase.load { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let data):
                print(data.count)
                self.doctors = data
                self.fetchImages(for: data)
            case .failure(let error):
                self.presenter.obtainedError(messege: error.localizedDescription)
            }
        }
    }
    
    func obtainCurrentDoctor(with indexPath: IndexPath) {
        self.loadSingleDoctorImageuseCase.load(model: self.doctors[indexPath.row]) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let data):
                self.presenter.obtainedCurrentDoctor(model: self.doctors[indexPath.row], image: data)
            case .failure(let error):
                self.presenter.obtainedError(messege: error.localizedDescription)
            }
        }
    }
}

private extension DoctorsInteractor {
    func fetchImages(for models: [Doctor]) {
        self.loadDoctorsImagesUseCase.load(models: models) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let data):
                print(data.count)
                self.presenter.obtainedDoctors(models: self.doctors, images: data)
            case .failure(let error):
                self.presenter.obtainedError(messege: error.localizedDescription)
            }
        }
    }
}
