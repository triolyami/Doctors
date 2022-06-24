//
//  BaseCollectionViewButton.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//
import UIKit

enum TypeOfOperation {
    case cancel
    case reshedule
}

final class BaseCollectionViewButton: UIButton {
    var id: UUID?
    var typeOfOperation: TypeOfOperation?
}
