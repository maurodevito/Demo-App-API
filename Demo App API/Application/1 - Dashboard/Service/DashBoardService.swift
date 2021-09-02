//
//  DashBoardService.swift
//  Demo App API
//
//  Created by Mauro De Vito on 02/09/2021.
//

import Foundation
import BrightFutures
import Alamofire

class DashboardService {
    static var share: DashboardService = DashboardService()
    
    private init () {
    }
    

    func getAllPosts() -> Future<[PostResponseModel], Error> {
        let promise = Promise<[PostResponseModel], Error>()
        let url = URL(string: API.getPosts.rawValue)!
        AF.request(url,
                   method: HTTPMethod.get,
                   parameters: nil,
                   encoding: JSONEncoding.prettyPrinted,
                   headers: nil,
                   interceptor: nil)
            .validate()
            .responseDecodable(of: [PostResponseModel].self) { response in
                guard let model = response.value else {
                    let error = CustomError.getPostsError("Error retrieving posts list")
                    promise.failure(error)
                    return
                }
                promise.success(model)
            }
        return promise.future
    }
    
}
