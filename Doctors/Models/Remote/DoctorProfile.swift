//
//  DoctorProfile.swift
//  Doctors
//
//  Created by Sergey on 22.06.2022.
//

import Foundation

struct DoctorProfile {
    let name: String
    let image: Data
    let latitudeCoordinate: String
    let longitudeCoordinage: String
    
    init(model: Doctor, image: Data) {
        self.name = model.name
        self.image = image
        self.latitudeCoordinate = model.latitudeCoordinate
        self.longitudeCoordinage = model.longitudeCoordinage
    }
}
