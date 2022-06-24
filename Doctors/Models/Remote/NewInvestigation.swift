//
//  NewInvestigation.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import Foundation

struct NewInvestigation: IUrlToImage {
    let author: String?
    let title: String
    let urlToImage: String
    let publishedAt: String
    let content: String
    
    init(article: Article) {
        guard let strongURLToImage = article.urlToImage else {
            assert(false, "bad url(unreal)")
        }
        self.author = article.author
        self.title = article.title
        self.urlToImage = strongURLToImage
        self.publishedAt = article.publishedAt
        self.content = article.content
    }
}
