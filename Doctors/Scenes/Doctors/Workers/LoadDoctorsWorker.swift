//
//  LoadDoctorsWorker.swift
//  Doctors
//
//  Created by Sergey on 21.06.2022.
//

import Foundation
protocol ILoadDoctorsWorker: AnyObject {
    func load(completion: @escaping (Result<[Doctor], Error>) -> Void)
}

final class LoadDoctorsWorker {
    private enum Endpoints {
        static let doctorsEndpoint = "https://randomuser.me/api/?results=15"
    }
    
    private let service: INetworkService
    
    init(service: INetworkService) {
        self.service = service
    }
}

extension LoadDoctorsWorker: ILoadDoctorsWorker {
    func load(completion: @escaping (Result<[Doctor], Error>) -> Void) {
        var doctors = [Doctor]()
        self.service.loadData(endpoint: Endpoints.doctorsEndpoint) { (result: Result<DoctorsDTO, Error>) in
            switch result {
            case .success(let data):
                for element in data.results {
                    let doctor = Doctor(model: element)
                    doctors.append(doctor)
                }
                DispatchQueue.main.async {
                    completion(.success(doctors))
                }

            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
