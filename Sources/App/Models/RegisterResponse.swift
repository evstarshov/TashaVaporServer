//
//  File.swift
//  
//
//  Created by Евгений Старшов on 31.03.2022.
//

import Vapor

struct RegisterResponse: Content {
    var result: Int
    var user_message: String?
    var error_message: String?
}
