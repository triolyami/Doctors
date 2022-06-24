//
//  DoctrorsPresenter.swift
//  Doctors
//
//  Created by Sergey on 21.06.2022.
//

import Foundation

protocol IDoctorsPresenter: AnyObject {
    func obtainedError(messege: String)
    func obtainedDoctors(models: [Doctor], images: [Int: Data?])
    func obtainedCurrentDoctor(model: Doctor, image: Data)
}

final class DoctorsPresenter {
    private weak var vc: IDoctorsViewController?
}

extension DoctorsPresenter: IDoctorsPresenter {
    
    func obtainedError(messege: String) {
        vc?.showError(message: messege)
    }
    
    func obtainedDoctors(models: [Doctor], images: [Int : Data?]) {
        let doctorsViewModel = self.mapInDoctorViewModels(models: models, images: images)
        self.vc?.setupData(with: doctorsViewModel)
    }
    
    func obtainedCurrentDoctor(model: Doctor, image: Data) {
        let doctorProfile = DoctorProfile(model: model, image: image)
        self.vc?.showCurrenDoctorProfile(with: doctorProfile)
    }
}

//MARK: - For Assembler
extension DoctorsPresenter {
    func setVc(with vc: IDoctorsViewController) {
        self.vc = vc
    }
}

private extension DoctorsPresenter {
    func mapInDoctorViewModels(models: [Doctor], images: [Int: Data?]) -> [DoctorViewModel] {
        var doctorViewModels = [DoctorViewModel]()
        for i in 0..<models.count {
            let name = models[i].name
            let image = images[i]
            
            doctorViewModels.append(DoctorViewModel(name: name, image: image ?? nil))
        }
        return doctorViewModels
    }
}

