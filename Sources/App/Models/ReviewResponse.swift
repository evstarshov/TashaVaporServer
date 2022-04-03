//
//  File.swift
//  
//
//  Created by Евгений Старшов on 03.04.2022.
//

import Vapor

struct ReviewResponse: Content {
    let userId: Int?
    let reviewText: String?
}
