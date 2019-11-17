//
//  Article.swift
//  GoodNews
//
//  Created by Lucas Inocencio on 14/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
