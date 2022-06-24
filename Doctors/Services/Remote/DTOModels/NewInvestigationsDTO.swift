//
//  NewInvestigationDTO.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import Foundation

// MARK: - NewInvestigationsDTO
struct NewInvestigationsDTO: Codable {
    let status: String
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let author: String?
    let title: String
    let urlToImage: String?
    let publishedAt: String
    let content: String
}
