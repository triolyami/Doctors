//
//  LoadSymptomsWorker.swift
//  Doctors
//
//  Created by Sergey on 23.06.2022.
//

import Foundation

protocol ILoadSymptomsWorker: AnyObject {
    func load() -> [Symptom]
}

final class LoadSymptomsWorker {
}

extension LoadSymptomsWorker: ILoadSymptomsWorker {
    func load() -> [Symptom] {
        let symptoms = SymptomsFetcher.getSymptoms()
        return symptoms
    }
}

