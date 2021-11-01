//
//  CustomError.swift
//  Demo App API
//
//  Created by Mauro De Vito on 02/09/2021.
//

import Foundation

enum CustomError: Error {
    case getPostsError(String)
    case addPostError(String)
}
