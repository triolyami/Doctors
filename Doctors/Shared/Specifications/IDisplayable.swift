//
//  IDisplayable.swift
//  Doctors
//
//  Created by Sergey on 21.06.2022.
//

import UIKit

protocol IDisplayable: UICollectionViewCell {
    associatedtype T
    static var identifier: String { get }
    func display(with vm: T)
}

