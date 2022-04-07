//
//  File.swift
//  
//
//  Created by Евгений Старшов on 07.04.2022.
//

import Vapor

class ReviewController {
    func getReviews(_ req: Request) throws -> EventLoopFuture<[ReviewResponse]> {
        guard let body = try? req.content.decode(Product.self) else { throw Abort(.badRequest) }
        
        print(body)
        
        let response = [
            ReviewResponse(userId: 123, reviewText: "Все супер!"),
            ReviewResponse(userId: 345, reviewText: "Мне не понравилось, ставлю 1 звезду"),
        ]
        
        return req.eventLoop.future(response)
    }
    
    func addReview(_ req: Request) throws -> EventLoopFuture<DefaultResponse> {
        guard let body = try? req.content.decode(Review.self) else { throw Abort(.badRequest) }
        
        print(body)
        
        let response = DefaultResponse(
            result: 1,
            successMessage: "Ваш отзыв был передан на модерацию.",
            errorMessage: nil
        )
        
        return req.eventLoop.future(response)
    }
    
    func removeReview(_ req: Request) throws -> EventLoopFuture<DefaultResponse> {
        guard let body = try? req.content.decode(Review.self) else { throw Abort(.badRequest) }
        
        print(body)
        
        let response = DefaultResponse(
            result: 1,
            successMessage: "Отзыв успешно удален",
            errorMessage: nil
        )
        
        return req.eventLoop.future(response)
    }
}
