//
//  File.swift
//  
//
//  Created by Евгений Старшов on 03.04.2022.
//

import Vapor

struct Catalog: Content {
    var pageNumber: Int?
    var categoryId: Int?
}
