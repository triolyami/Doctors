//
//  DataManager.swift
//  Doctors
//
//  Created by Sergey on 22.06.2022.
//

import Foundation
import CoreData

protocol IDataManager: AnyObject {
    var delegate: DataManagerDelegate? { get set }
    func count() -> Int
    func objects() -> [Appointment]
    func createAppointment(doctor: DoctorProfile, date: Date)
    func deleteAppointment(with id: UUID?)
}

protocol DataManagerDelegate: AnyObject {
    func shouldDeletaRowAt(indexPath: IndexPath)
    func shouldInsertRowAt(model: Appointment, newIndexPath: IndexPath)
    func shoultUpdateRowAt(model: Appointment, indexPath: IndexPath)
    func shouldUpdateTable(models: [Appointment])
}

final class DataManager: NSObject {
    
    static let shared = DataManager()
    
    private let coreDataService: ICoreDataService = CoreDataService()
    
    weak var delegate: DataManagerDelegate?

    override private init() {
        super.init()
        self.coreDataService.frc.delegate = self
        self.performFetch()
    }
}

extension DataManager: IDataManager {
    func count() -> Int {
        guard let count = self.coreDataService.frc.sections?.first?.numberOfObjects else { return 0 }
        return count
    }
        
    func objects() -> [Appointment] {
        var appointments = [Appointment]()
        let fetchedObjects = self.coreDataService.frc.fetchedObjects
        for element in fetchedObjects ?? [] {
            appointments.append(Appointment(model: element))
        }
        return appointments
    }
    
    func createAppointment(doctor: DoctorProfile, date: Date) {
        coreDataService.createAppointment(doctor: doctor, date: date)
    }
    
    func deleteAppointment(with id: UUID?) {
        guard let id = id,
              let appointmentEntity = self.getEntityById(id) else {
            return
        }
        coreDataService.delete(appointment: appointmentEntity)
    }
    
    func updateAppointment(with id: UUID?, date: Date) {
        guard let id = id,
              let appointmentEntity = self.getEntityById(id) else {
            return
        }
        coreDataService.update(appointment: appointmentEntity, date: date)
    }
    
    func getObjectWithId(_ id: UUID?) -> Appointment? {
        guard let id = id,
              let appointmentEntity = self.getEntityById(id) else {
            return nil
        }
        
        return Appointment(model: appointmentEntity)
    }
}
    
extension DataManager: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            guard let newIndexPath = newIndexPath,
                  let appointmentEntity = anObject as? AppointmentEntity else {
                return
            }
            let appointment = Appointment(model: appointmentEntity)
            
            self.delegate?.shouldInsertRowAt(model: appointment, newIndexPath: newIndexPath)
        case .delete:
            guard let indexPath = indexPath else {
                return
            }
            self.delegate?.shouldDeletaRowAt(indexPath: indexPath)
        case .update:
            guard let newIndexPath = newIndexPath,
                  let appointmentEntity = anObject as? AppointmentEntity else {
                return
            }
            let appointment = Appointment(model: appointmentEntity)
            self.delegate?.shoultUpdateRowAt(model: appointment, indexPath: newIndexPath)
        case .move:
            let appointments = self.objects()
            self.delegate?.shouldUpdateTable(models: appointments)
        @unknown default:
            assert(false)
        }
    }
}

private extension DataManager {
    func performFetch() {
        do {
            try self.coreDataService.frc.performFetch()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
        
    func getEntityById(_ id: UUID) -> AppointmentEntity? {
        let request = AppointmentEntity.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(
            format: "id = %@", id.uuidString)
        let context =  self.coreDataService.frc.managedObjectContext
        var appointmentCoreDataEntity: AppointmentEntity?
        do {
            appointmentCoreDataEntity = try context.fetch(request)[0]
        } catch {
            let error = error
            print(error)
        }
        return appointmentCoreDataEntity
    }
}
