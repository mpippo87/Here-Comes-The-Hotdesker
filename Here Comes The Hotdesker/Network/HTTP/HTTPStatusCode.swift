//
//  HTTPStatusCode.swift
//  QRd
//
//  Created by Filippo Minelle on 26/02/2020.
//  Copyright © 2020 Filippo Minelle. All rights reserved.
//

import Foundation

enum HTTPStatusCode: Int {
    
    case ok = 200
    case created = 201
    case badRequest = 400
    case authenticationFailure = 401
    case forbidden = 403
    case resourceNotFound = 404
    case methodNotAllowed = 405
    case conflict = 409
    case preconditionFailed = 412
    case requestEntityTooLarge = 413
    case internalServerError = 500
    case notImplemented = 501
    case serviceUnavailable = 503

}

