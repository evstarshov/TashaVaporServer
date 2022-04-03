//
//  File.swift
//  
//
//  Created by Евгений Старшов on 03.04.2022.
//

import Vapor

struct DefaultResponse: Content {
    var result: Int
    var successMessage: String?
    var errorMessage: String?
}
