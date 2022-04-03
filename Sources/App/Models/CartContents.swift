//
//  File.swift
//  
//
//  Created by Евгений Старшов on 03.04.2022.
//

import Vapor

struct CartResponse: Content {
    var amount: Int?
    var count: Int?
    var contents: [CartContents]
}

struct CartContents: Content {
    var productId: Int?
    var productName: String?
    var productPrice: Int?
    var quantity: Int?
}
