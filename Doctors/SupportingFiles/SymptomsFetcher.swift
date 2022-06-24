//
//  SymptomsFetcher.swift
//  Doctors
//
//  Created by Sergey on 23.06.2022.
//

import Foundation


final class SymptomsFetcher {
    static func getSymptoms() -> [Symptom] {
        return [
            Symptom(name: "Nausea", imageName: "Nausea"),
            Symptom(name: "Headache", imageName: "Headache"),
            Symptom(name: "Cough", imageName: "Cough"),
            Symptom(name: "Temperature", imageName: "Temperature")
        ]
    }
}
