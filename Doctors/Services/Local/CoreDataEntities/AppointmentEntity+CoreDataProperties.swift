//
//  AppointmentEntity+CoreDataProperties.swift
//  Doctors
//
//  Created by Sergey on 22.06.2022.
//
//

import Foundation
import CoreData


extension AppointmentEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AppointmentEntity> {
        return NSFetchRequest<AppointmentEntity>(entityName: "AppointmentEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var nameOfDoctor: String?
    @NSManaged public var time: Date?
    @NSManaged public var imageOfDoctor: Data?

}

extension AppointmentEntity : Identifiable {

}
