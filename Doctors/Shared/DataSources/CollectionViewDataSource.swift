//
//  CollectionViewDataSource.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import UIKit


final class CollectionViewDataSource<Cell: IDisplayable>: NSObject, UICollectionViewDataSource {
    
    var items = [Cell.T]()
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as? Cell else {
            return UICollectionViewCell()
        }
        
        cell.display(with: items[indexPath.row])
        return cell
    }
}
