//
//  Appointment.swift
//  Doctors
//
//  Created by Sergey on 22.06.2022.
//

import Foundation

struct Appointment {
    let id: UUID?
    let nameOfDoctor: String
    let imageOfDoctor: Data?
    let date: Date?
    
    init(model: AppointmentEntity) {
        
        self.id = model.id
        self.nameOfDoctor = model.nameOfDoctor ?? "Noname"
        self.imageOfDoctor = model.imageOfDoctor
        self.date = model.time
    }
}
