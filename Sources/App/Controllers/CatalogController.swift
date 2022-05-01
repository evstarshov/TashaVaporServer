//
//  File.swift
//  
//
//  Created by Евгений Старшов on 17.04.2022.
//

import Vapor


class CatalogController {
    
    func getCatalog(_ req: Request) throws -> EventLoopFuture<[CatalogResponse]> {
        guard let body = try? req.content.decode(Catalog.self) else { throw Abort(.badRequest) }
        
        print(body)
        
        let response = [
            CatalogResponse(productId: 123, productName: "Яркий тортик маша и медведь", price: 3300, shortDescription: "Внутри торт «трюфель»:\nшоколадные коржи, трюфельная шоколадная начинка, шоколадный кремчиз", picUrl: "https://sun9-78.userapi.com/s/v1/ig2/uxyctBBWNrGkj_2f5n2cY77DcOyv-SZVvADvOhNS1ZhpR_mOmNCp4hLbcCB7bORG3U1jXSEQBxqQABbXtr5dMQtD.jpg?size=1440x1800&quality=96&type=album"),
            CatalogResponse(productId: 124, productName: "Двухярусный свадебный торт", price: 7900, shortDescription: "Торт украшение для вашей свадьбы", picUrl: "https://sun9-1.userapi.com/impg/MiMiqpexbfOA0EB7bM9cGxfK9I-tbPHWujAPSw/LvGdoeto8V4.jpg?size=1440x1719&quality=96&sign=abdf44d6089c41022cf5d3b2a4e9df30&type=album"),
            CatalogResponse(productId: 125, productName: "Медовый торт цифра", price: 2499, shortDescription: "на день рождения пенсионеру", picUrl: "https://sun9-35.userapi.com/impg/1qJD1cZIWeiqOR2AJeH_B-9WZ2DUQXsZJ-K8eg/AlF40B0kDwM.jpg?size=1440x1440&quality=96&sign=b6fb638231c1dc993ae46a99a5839432&type=album"),
        ]
        
        return req.eventLoop.future(response)
    }
    
    func getProduct(_ req: Request) throws -> EventLoopFuture<ProductResponse> {
        guard let body = try? req.content.decode(Product.self) else { throw Abort(.badRequest) }
        
        print(body)
        
        var response = ProductResponse(result: 1, productId: 999, productName: "Неизвестный товар.", price: 0, description: "Неизвестный товар, непонятный.", picUrl: nil)
        
        switch body.productId {
        case 123: response = ProductResponse(result: 1, productId: 123, productName: "Яркий тортик маша и медведь", price: 3300, description: "Внутри торт «трюфель»:\nшоколадные коржи, трюфельная шоколадная начинка, шоколадный кремчиз", picUrl: "https://vk.com/photo-211980076_457239018?access_key=4763903cc5d31aed5b")
        case 124: response = ProductResponse(result: 1, productId: 124, productName: "Двухярусный свадебный торт", price: 7900, description: "Торт украшение для вашей свадьбы", picUrl: "https://sun9-1.userapi.com/impg/MiMiqpexbfOA0EB7bM9cGxfK9I-tbPHWujAPSw/LvGdoeto8V4.jpg?size=1440x1719&quality=96&sign=abdf44d6089c41022cf5d3b2a4e9df30&type=album")
        case 125: response = ProductResponse(result: 1, productId: 125, productName: "Медовый торт цифра", price: 2499, description: "На день рождения пенсионеру", picUrl: "https://sun9-35.userapi.com/impg/1qJD1cZIWeiqOR2AJeH_B-9WZ2DUQXsZJ-K8eg/AlF40B0kDwM.jpg?size=1440x1440&quality=96&sign=b6fb638231c1dc993ae46a99a5839432&type=album")
        default: response = ProductResponse(result: 1, productId: 999, productName: "Неизвестный товар.", price: 0, description: "Неизвестный товар, непонятный.", picUrl: nil)
        }
        
        return req.eventLoop.future(response)
    }
}
