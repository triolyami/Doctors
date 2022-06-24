//
//  LoadSingleImageUseCase.swift
//  Doctors
//
//  Created by Sergey on 22.06.2022.
//

import Foundation

protocol ILoadSingleImageUseCase: AnyObject {
    func load(model: IUrlToImage, completion: @escaping (Result<Data, Error>) -> Void)
}

final class LoadSingleImageUseCase {
    private let worker: ILoadImageWorker
    
    init(worker: ILoadImageWorker) {
        self.worker = worker
    }
}

extension LoadSingleImageUseCase: ILoadSingleImageUseCase {
    func load(model: IUrlToImage, completion: @escaping (Result<Data, Error>) -> Void) {
        self.worker.loadImage(urlString: model.urlToImage) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

