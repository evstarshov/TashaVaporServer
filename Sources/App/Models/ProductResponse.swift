//
//  File.swift
//  
//
//  Created by Евгений Старшов on 03.04.2022.
//

import Foundation

struct ProductResponse: Content {
    let result: Int?
    let productId: Int?
    let productName: String?
    let price: Int?
    let description: String?
    let picUrl: String?
}
