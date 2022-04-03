//
//  File.swift
//  
//
//  Created by Евгений Старшов on 03.04.2022.
//

import Foundation

struct CatalogResponse: Content {
    let productId: Int?
    let productName: String?
    let price: Int?
    let shortDescription: String?
    let picUrl: String?
}
