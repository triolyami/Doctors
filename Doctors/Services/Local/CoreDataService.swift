//
//  CoreDataService.swift
//  Doctors
//
//  Created by Sergey on 22.06.2022.
//

import Foundation
import CoreData

protocol ICoreDataService: AnyObject {
    var frc: NSFetchedResultsController<AppointmentEntity> { get }
    func createAppointment(doctor: DoctorProfile, date: Date)
    func appointmentFetchRequest() -> NSFetchRequest<AppointmentEntity>
    func delete(appointment: AppointmentEntity)
    func update(appointment: AppointmentEntity, date: Date)
}

final class CoreDataService: ICoreDataService {
        
    private lazy var context: NSManagedObjectContext = persistentContainer.viewContext

    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Doctors")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var frc = NSFetchedResultsController<AppointmentEntity>(fetchRequest: self.appointmentFetchRequest(), managedObjectContext: self.context, sectionNameKeyPath: nil, cacheName: nil)
    
    func createAppointment(doctor: DoctorProfile, date: Date) {
        let appointmentEntity = AppointmentEntity(context: self.context)
        appointmentEntity.nameOfDoctor = doctor.name
        appointmentEntity.id = UUID()
        appointmentEntity.imageOfDoctor = doctor.image
        appointmentEntity.time = date
        saveContext()
    }
    
    func appointmentFetchRequest() -> NSFetchRequest<AppointmentEntity> {
        let request: NSFetchRequest<AppointmentEntity> = AppointmentEntity.fetchRequest()
        request.sortDescriptors = [.init(keyPath: \AppointmentEntity.time, ascending: true)]
        return request
    }
    
    func delete(appointment: AppointmentEntity) {
        self.context.delete(appointment)
        self.saveContext()
    }
    
    func update(appointment: AppointmentEntity, date: Date) {
        appointment.time = date
        self.saveContext()
    }
}

private extension CoreDataService {
    func saveContext () {
        if self.context.hasChanges {
            do {
                try self.context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
