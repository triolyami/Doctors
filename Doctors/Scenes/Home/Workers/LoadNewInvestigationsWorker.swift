//
//  LoadNewInvestigationsWorker.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import Foundation

protocol ILoadNewInvestigationsWorker: AnyObject {
    func load(completion: @escaping (Result<[NewInvestigation], Error>) -> Void)
}

final class LoadNewInvestigationsWorker {
    private enum Endpoints {
        static let defaultEndpoint = "https://newsapi.org/v2/everything?q=investigation&pageSize=15&from=2022-06-18&to=2022-06-18&sortBy=popularity&apiKey=822000319ba745e0a48fc63d0a2e81ab"
    }
    
    private let service: INetworkService
    
    init(service: INetworkService) {
        self.service = service
    }
}

extension LoadNewInvestigationsWorker: ILoadNewInvestigationsWorker {
    func load(completion: @escaping (Result<[NewInvestigation], Error>) -> Void) {
        var newInvestigations = [NewInvestigation]()
        self.service.loadData(endpoint: Endpoints.defaultEndpoint) { (result: Result<NewInvestigationsDTO, Error>) in
            switch result {
            case .success(let data):
                for element in data.articles {
                    if element.urlToImage == nil {
                        continue
                    }
                    let newInvestigation = NewInvestigation(article: element)
                    newInvestigations.append(newInvestigation)
                }
                DispatchQueue.main.async {
                    completion(.success(newInvestigations))
                }

            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
