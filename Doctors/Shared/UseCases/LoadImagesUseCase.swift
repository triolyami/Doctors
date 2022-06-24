//
//  LoadNewInvestigationImagesUseCase.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import Foundation

protocol ILoadImagesUseCase: AnyObject {
    func load(models: [IUrlToImage], completion: @escaping (Result<[Int: Data?], Error>) -> Void)
}

final class LoadImagesUseCase {
    private let worker: ILoadImageWorker
    
    init(worker: ILoadImageWorker) {
        self.worker = worker
    }
}

extension LoadImagesUseCase: ILoadImagesUseCase {
    func load(models: [IUrlToImage], completion: @escaping (Result<[Int: Data?], Error>) -> Void) {
        var imagesDict = [Int: Data?]()
        var fetchedDataCount = 0
        for i in 0..<models.count  {
            self.worker.loadImage(urlString: models[i].urlToImage) { result in
                switch result {
                case .success(let data):
                    fetchedDataCount += 1
                    imagesDict[i] = data
                    if fetchedDataCount == models.count {
                        completion(.success(imagesDict))
                    }
                case .failure(let error):
                    fetchedDataCount += 1
                    print(error.localizedDescription)
                    imagesDict[i] = nil
                }
            }
        }
    }
}

typealias FetchedImagesDictionary = [Int: Data?]
