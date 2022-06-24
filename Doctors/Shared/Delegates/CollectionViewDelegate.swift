//
//  CollectionViewDelegate.swift
//  Doctors
//
//  Created by Sergey on 21.06.2022.
//

import UIKit

final class CollectionViewDelegate: NSObject, UICollectionViewDelegate {
    private enum Constants {
        static let collectionViewCellHeight = CGFloat(112)
        static let collectionViewWidthSub = CGFloat(32)
    }
    
    var didSelectRowHandler: ((IndexPath) -> ())?
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.didSelectRowHandler?(indexPath)
    }
}

extension CollectionViewDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: UIScreen.main.bounds.width - Constants.collectionViewWidthSub,
                      height: Constants.collectionViewCellHeight)
    }
}
    
