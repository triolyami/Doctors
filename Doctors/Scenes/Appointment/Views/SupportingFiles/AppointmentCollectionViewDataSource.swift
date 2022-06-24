//
//  AppointmentCollectionViewDataSource.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import UIKit

protocol ICellDisplayable {
    func displayData(with model: AppointmentViewModel, buttonHandlers: ((TypeOfOperation) -> Void)?)
}

protocol IAppointmentCollectionViewDataSource: UICollectionViewDataSource {
    var items: [AppointmentViewModel] { get set }
    var cellButtonsHandler: ((TypeOfOperation?, UUID?) -> Void)? { get set }
    func deleteItemAtRow(indexPath: IndexPath)
    func insertRowAt(vm: AppointmentViewModel, indexPath: IndexPath)
    func updateRows(with vmList: [AppointmentViewModel])
    func updateRowAt(vm: AppointmentViewModel, indexPath: IndexPath)
}

final class AppointmentCollectionViewDataSource: NSObject {
    
    var items = [AppointmentViewModel]()
        
    var cellButtonsHandler: ((TypeOfOperation?, UUID?) -> Void)?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppointmentCollectionViewCell.identifier, for: indexPath) as? AppointmentCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.displayData(with: items[indexPath.row], handler: self.cellButtonsHandler)
        return cell
    }
}

extension AppointmentCollectionViewDataSource: IAppointmentCollectionViewDataSource {
    func deleteItemAtRow(indexPath: IndexPath) {
        self.items.remove(at: indexPath.row)
    }
    
    func insertRowAt(vm: AppointmentViewModel, indexPath: IndexPath) {
        self.items.insert(vm, at: indexPath.row)
    }
    
    func updateRowAt(vm: AppointmentViewModel, indexPath: IndexPath) {
        self.items[indexPath.row] = vm
    }
    
    func updateRows(with vmList: [AppointmentViewModel]) {
        self.items = vmList
    }
}
