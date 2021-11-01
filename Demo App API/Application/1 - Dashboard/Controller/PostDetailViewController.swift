//
//  PostDetailViewController.swift
//  Demo App API
//
//  Created by Mauro De Vito on 02/09/2021.
//

import UIKit
// swiftlint:disable line_length

class PostDetailViewController: BaseViewController<PostDetailManager> {
    private var post: PostUIModel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!

    static func storyboardInstance(with post: PostUIModel) -> PostDetailViewController {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let viewController = (storyboard.instantiateViewController(withIdentifier: "postDetailStoryboardID") as? PostDetailViewController)!
        viewController.post = post
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager.viewControllerDelegate = self
        self.title = "Post"
        self.idLabel.text = String(post.id)
        self.userIdLabel.text = String(post.userId)
        self.titleLabel.text = post.title
        self.bodyTextView.text = post.body
    }

}

extension PostDetailViewController: PostDetailControllerDelegate {
}
