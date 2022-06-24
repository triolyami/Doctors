//
//  HomePresenter.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import Foundation

protocol IHomePresenter: AnyObject {
    func obtainedError(messege: String)
    func obtainedNewInvestigations(models: [NewInvestigation], images: [Int: Data?])
    func obtainedSymptoms(models: [Symptom])
}

final class HomePresenter {
    private weak var vc: IHomeViewController?
}

extension HomePresenter: IHomePresenter {
    func obtainedSymptoms(models: [Symptom]) {
        let symptomViewModels = self.mapInSymptomsViewModel(models: models)
        self.vc?.setSymptoms(with: symptomViewModels)
    }
    
    func obtainedError(messege: String) {
        print(messege)
    }
    
    func obtainedNewInvestigations(models: [NewInvestigation], images: [Int: Data?]) {
        let newInwestigationViewModels = self.mapInNewInvestigationViewModels(models: models, images: images)
        self.vc?.setNewInvestigation(with: newInwestigationViewModels)
    }
}

//MARK: - For Assembler
extension HomePresenter {
    func setVc(with vc: IHomeViewController) {
        self.vc = vc
    }
}

private extension HomePresenter {
    func mapInSymptomsViewModel(models: [Symptom]) -> [SymptomViewModel] {
        var symptomViewModels = [SymptomViewModel]()
        for model in models {
            symptomViewModels.append(SymptomViewModel(name: model.name, imageName: model.imageName))
        }
        return symptomViewModels
    }
    
    func mapInNewInvestigationViewModels(models: [NewInvestigation], images: [Int: Data?]) -> [NewInvestigationViewModel] {
        var newInwestigationViewModels = [NewInvestigationViewModel]()
        for i in 0..<models.count {
            let author = models[i].author
            let title = models[i].title
            let image = images[i]
            let content = models[i].content

            newInwestigationViewModels.append(NewInvestigationViewModel(author: author,
                                                                        title: title,
                                                                        urlToImage: image ?? nil,
                                                                        content: content))
        }
        return newInwestigationViewModels
    }
}
