//
//  Doctor.swift
//  Doctors
//
//  Created by Sergey on 21.06.2022.
//

import Foundation

struct Doctor: IUrlToImage {
    let name: String
    let urlToImage: String
    let latitudeCoordinate: String
    let longitudeCoordinage: String
    
    init(model: DoctorResult) {
        self.name = model.name.first + " " + model.name.last
        self.urlToImage = model.picture.medium
        self.latitudeCoordinate = model.location.coordinates.latitude
        self.longitudeCoordinage = model.location.coordinates.longitude
    }
}
