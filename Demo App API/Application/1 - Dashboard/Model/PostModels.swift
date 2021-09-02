//
//  PostModels.swift
//  Demo App API
//
//  Created by Mauro De Vito on 02/09/2021.
//

import Foundation

struct PostResponseModel: Decodable {
    let id: UInt
    let title: String
    let body: String
    let userId: UInt
}

struct PostUIModel: Decodable {
    let id: UInt
    let title: String
    let body: String
    let userId: UInt
    
    init(postRespModel: PostResponseModel) {
        self.id = postRespModel.id
        self.title = postRespModel.title
        self.body = postRespModel.body
        self.userId = postRespModel.userId
    }
}

struct PostRequestModel: Decodable {
    let title: String
    let body: String
    let userId: UInt
}
