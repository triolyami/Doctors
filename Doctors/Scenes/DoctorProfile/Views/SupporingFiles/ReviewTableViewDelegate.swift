//
//  ReviewTableViewDataSource.swift
//  Doctors
//
//  Created by Sergey on 24.06.2022.
//

import UIKit

protocol IReviewTableViewDelegate: UITableViewDelegate {
    var didSelectRowHandler: ((IndexPath) -> ())? { get set }
}

final class ReviewTableViewDelegate: NSObject {
    
    var didSelectRowHandler: ((IndexPath) -> ())?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelectRowHandler?(indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: ReviewTableViewHeader.identifier) as? ReviewTableViewHeader else {
            return UITableViewHeaderFooterView()
        }
        return view
    }
}

extension ReviewTableViewDelegate: IReviewTableViewDelegate {
    
}
