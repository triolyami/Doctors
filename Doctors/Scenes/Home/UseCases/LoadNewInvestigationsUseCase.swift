//
//  LoadNewInvestigationsDataUseCase.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import Foundation

protocol ILoadNewInvestigationsUseCase: AnyObject {
    func load(completion: @escaping (Result<[NewInvestigation], Error>) -> Void)
}

final class LoadNewInvestigationsUseCase {
    private let worker: ILoadNewInvestigationsWorker
    
    init(worker: ILoadNewInvestigationsWorker) {
        self.worker = worker
    }
    
}

extension LoadNewInvestigationsUseCase: ILoadNewInvestigationsUseCase {
    func load(completion: @escaping (Result<[NewInvestigation], Error>) -> Void) {
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
