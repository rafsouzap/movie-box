//
//  ServiceError.swift
//  MovieBox
//
//  Created by Rafael de Paula on 04/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

enum ServiceError {
    case unauthorized
    case forbidden
    case notFound
    case timeOut
    case invalidUrl
    case invalidResponse
    case notMapped
    
    var code: Int {
        switch self {
        case .unauthorized: return 401
        case .forbidden: return 403
        case .notFound: return 404
        case .timeOut: return 504
        default: return 0
        }
    }
    
    var description: String {
        switch self {
        case .unauthorized: return "Credenciais de acesso inválidas"
        case .forbidden: return "Solicitação não autorizada"
        case .notFound: return "Recurso solicitado não encontrado"
        case .timeOut: return "Tempo de comunicação com o servidor excedido"
        case .invalidUrl: return "URL inválida"
        case .invalidResponse: return "Resposta inválida"
        default: return "Falha na comunicação com o servidor"
        }
    }
    
    init(code: Int) {
        switch code {
        case 401: self = .unauthorized
        case 403: self = .forbidden
        case 404: self = .notFound
        case 504: self = .timeOut
        default: self = .notMapped
        }
    }
}
