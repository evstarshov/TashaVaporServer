//
//  File.swift
//  
//
//  Created by Евгений Старшов on 03.04.2022.
//

import Vapor

struct Review: Content {
    var productId: Int?
    var userId: Int?
    var reviewText: String?
    var reviewId: Int?
}
