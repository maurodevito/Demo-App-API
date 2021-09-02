//
//  DashboardManager.swift
//  Demo App API
//
//  Created by Mauro De Vito on 01/09/2021.
//

import Foundation

class DashboardManager: BaseManager {
    weak var viewControllerDelegate: DashboardControllerDelegate!
    
    var postsResponseModel: [PostResponseModel] = []
    var postsUIModel: [PostUIModel] = []
    
    private func getAllPosts() {
        DashboardService.share.getAllPosts()
            .onSuccess(callback: { response in
                self.postsResponseModel = response
                self.postsUIModel = self.postsResponseModel.map({ (postResponseModel)  in
                    let postUIModel = PostUIModel(postRespModel: postResponseModel)
                    return postUIModel
                })
                
            })
            .onFailure(callback: { error in
                // TODO: Show Error Alert
                print("Error: \(error.localizedDescription)")
            })
    }
}

extension DashboardManager: DashboardManagerDelegate {
    func viewDidLoad() {
        self.getAllPosts()
    }
}
