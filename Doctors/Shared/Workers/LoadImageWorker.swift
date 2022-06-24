//
//  LoadImagesWorker.swift
//  Doctors
//
//  Created by Sergey on 21.06.2022.
//

import Foundation

protocol ILoadImageWorker: AnyObject {
    func loadImage(urlString: String, completion: @escaping (Result<Data, Error>) -> Void)
}

final class LoadImageWorker {
    
    private let service: INetworkService
    
    init(service: INetworkService) {
        self.service = service
    }
}

extension LoadImageWorker: ILoadImageWorker {
    func loadImage(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        self.service.loadImage(urlString: urlString) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
