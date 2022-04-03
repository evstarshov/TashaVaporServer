//
//  File.swift
//  
//
//  Created by Евгений Старшов on 31.03.2022.
//

import Vapor

class AuthController {
    
    let successResponse = DefaultResponse(
        result: 1,
        successMessage: "Запрос успешно обработан.",
        errorMessage: nil
    )
    
    let errorIncompleteDataResponse = DefaultResponse(
        result: -2,
        successMessage: nil,
        errorMessage: "Неполные данные. Обязательные поля: логин, пароль, адрес эл. почты, имя, фамилия."
    )
    
    let errorWrongCredentials = DefaultResponse(
        result: -3,
        successMessage: nil,
        errorMessage: "Неверный логин или пароль."
    )
    
    let errorInvalidEmail = DefaultResponse(
        result: -4,
        successMessage: nil,
        errorMessage: "Некорректный адрес электронной почты."
    )
    
    func register(_ req: Request) throws -> EventLoopFuture<DefaultResponse> {
        guard let body = try? req.content.decode(User.self) else { throw Abort(.badRequest) }
        
        guard body.login != nil, body.password != nil, body.name != nil, body.lastname != nil, body.email != nil else {
            return req.eventLoop.future(errorIncompleteDataResponse)
        }
        
        return req.eventLoop.future(successResponse)
    }
    
    func auth(_ req: Request) throws -> EventLoopFuture<DefaultResponse> {
        guard let body = try? req.content.decode(User.self) else { throw Abort(.badRequest) }
        
        if let userLogin = body.login, let userPassword = body.password {
            if userLogin != "rakodill" || userPassword != "mypass" {
                return req.eventLoop.future(errorWrongCredentials)
            } else {
                return req.eventLoop.future(successResponse)
            }
        } else {
            return req.eventLoop.future(errorIncompleteDataResponse)
        }
    }
    
    func logout(_ req: Request) throws -> EventLoopFuture<DefaultResponse> {
        guard let _ = try? req.content.decode(User.self) else { throw Abort(.badRequest) }
        return req.eventLoop.future(successResponse)
    }
    
    func changeUserData(_ req: Request) throws -> EventLoopFuture<DefaultResponse> {
        guard let body = try? req.content.decode(User.self) else { throw Abort(.badRequest) }
        
        guard body.id != nil, body.login != nil, body.password != nil, body.name != nil, body.lastname != nil, body.email != nil else {
            return req.eventLoop.future(errorIncompleteDataResponse)
        }
        
        return req.eventLoop.future(successResponse)
    }
}
