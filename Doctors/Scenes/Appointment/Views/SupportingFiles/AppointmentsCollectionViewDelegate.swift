//
//  AppointmentsCollectionViewDelegate.swift
//  Doctors
//
//  Created by Sergey on 23.06.2022.
//

import UIKit

final class AppointmentsCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    private enum Constants {
        static let cellHeight = CGFloat(230)
        static let collectionViewWidthSub = CGFloat(32)
    }
}

extension AppointmentsCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: UIScreen.main.bounds.size.width - Constants.collectionViewWidthSub,
                      height: Constants.cellHeight)
    }
}
