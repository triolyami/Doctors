//
//  NetworkService.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import Foundation

protocol INetworkService: AnyObject {
    func loadData<T: Codable>(endpoint: String, completion: @escaping(Result<T, Error>)->())
    func loadImage(urlString: String, completion: @escaping (Result<Data, Error>) -> ())
}

final class NetworkService {
    private let session: URLSession
    
    init() {
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }
}

extension NetworkService: INetworkService {
    func loadData<T:Decodable>(endpoint: String, completion: @escaping (Result<T, Error>) -> ()) {
        guard let url = URL(string: endpoint) else { return }
        
        let request = URLRequest(url: url)
        
        self.session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data,
                  let decoded = self.decodeJSON(type: T.self, from: data) else {
                return
            }
            completion(.success(decoded))
        }.resume()
    }
    
    func loadImage(urlString: String, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        self.session.downloadTask(with: request) { url, response, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let url = url else { return }
            if let data = try? Data(contentsOf: url) {
                completion(.success(data))
            }
        }.resume()
    }
}

private extension NetworkService {
    func decodeJSON<T: Decodable>(type: T.Type, from data: Data) -> T? {
        let decoder = JSONDecoder()
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        }
        catch let error {
            print("Cant decode Json with error: \(error)")
            return nil
        }
    }
}

