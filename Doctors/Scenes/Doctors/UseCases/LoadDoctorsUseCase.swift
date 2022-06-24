//
//  LoadDoctorsUseCase.swift
//  Doctors
//
//  Created by Sergey on 21.06.2022.
//

import Foundation

protocol ILoadDoctorsUseCase: AnyObject {
    func load(completion: @escaping (Result<[Doctor], Error>) -> Void)
}

final class LoadDoctorsUseCase {
    private let worker: ILoadDoctorsWorker
    
    init(worker: ILoadDoctorsWorker) {
        self.worker = worker
    }
    
}

extension LoadDoctorsUseCase: ILoadDoctorsUseCase {
    func load(completion: @escaping (Result<[Doctor], Error>) -> Void) {
        self.worker.load { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
}
