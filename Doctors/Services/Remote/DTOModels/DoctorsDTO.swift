//
//  DoctorsDTO.swift
//  Doctors
//
//  Created by Sergey on 21.06.2022.
//

import Foundation
// MARK: - DoctorsDTO
struct DoctorsDTO: Codable {
    let results: [DoctorResult]
}



// MARK: - Result
struct DoctorResult: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let phone, cell: String
    let picture: Picture
    let nat: String
}

// MARK: - Location
struct Location: Codable {
    let city, state, country: String
    let coordinates: Coordinates
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitude: String
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
}

// MARK: - Picture
struct Picture: Codable {
    let medium: String
}
