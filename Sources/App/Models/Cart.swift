//
//  File.swift
//  
//
//  Created by Евгений Старшов on 03.04.2022.
//

import Vapor

struct Cart: Content {
    var productId: Int?
    var quantity: Int?
}
