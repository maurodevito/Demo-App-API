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
//    static var share: DashboardService = DashboardService()
//
    private init () {
    }
    
    static func getAllPosts() -> Future<[PostResponseModel], Error> {
        let promise = Promise<[PostResponseModel], Error>()
        let url = URL(string: API.urlPosts.rawValue)!
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
    
    static func addNewPost(_ post: PostRequestModel) -> Future<UInt, Error> {
        let promise = Promise<UInt, Error>()
        let url = URL(string: API.urlPosts.rawValue)!
        
        let headers: HTTPHeaders = HTTPHeaders(["Content-Type": "'application/json; charset=UTF-8'"])
        let bodyParameters: [String: Any] = [
            "title": post.title,
            "body": post.body,
            "userId": post.userId
        ]
        
        AF.request(url,
                   method: HTTPMethod.post,
                   parameters: bodyParameters,
                   encoding: JSONEncoding.prettyPrinted,
                   headers: headers,
                   interceptor: nil).validate().responseJSON { (response) in

                        if let dic = response.value as? Dictionary<String, UInt> {
                            dic.keys.forEach { (key) in
                                if key == "id", let id = dic[key]  {
                                    promise.success(id)
                                } else {
                                    promise.failure(CustomError.addPostError("Error adding Post"))
                                }
                            }
                        } else {
                            promise.failure(CustomError.addPostError("Error adding Post"))
                        }
                   }
        return promise.future
    }
    
}
