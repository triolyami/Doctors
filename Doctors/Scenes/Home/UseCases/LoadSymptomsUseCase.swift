//
//  LoadSymptomsUseCase.swift
//  Doctors
//
//  Created by Sergey on 23.06.2022.
//

import Foundation

protocol ILoadSymptomsUseCase: AnyObject {
    func load() -> [Symptom]
}

final class LoadSymptomsUseCase {
    private let worker: ILoadSymptomsWorker
    
    init(worker: ILoadSymptomsWorker) {
        self.worker = worker
    }
}

extension LoadSymptomsUseCase: ILoadSymptomsUseCase {
    func load() -> [Symptom] {
        return self.worker.load()
    }
}
