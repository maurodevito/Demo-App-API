//
//  DashboardViewController.swift
//  Demo App API
//
//  Created by Mauro De Vito on 01/09/2021.
//

import UIKit
// swiftlint:disable line_length

class DashboardViewController: BaseViewController<DashboardManager> {

    @IBOutlet weak var tableView: UITableView!
    var rightButtonAddPost: UIBarButtonItem {
        UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(addPost))
    }

    private var posts: [PostUIModel] = []
    private let cellIdentifier = "DashboardTableViewCellIdentifier"

    static func storyboardInstance() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let navController = (storyboard.instantiateViewController(withIdentifier: "dashboardStoryboardID") as? UINavigationController)!
        return navController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setRightBarButton(rightButtonAddPost, animated: false)
        self.title = "All Posts"

        let nib = UINib(nibName: "DashboardTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: cellIdentifier)

        self.manager.viewControllerDelegate = self
        self.manager.viewDidLoad()
    }

    @objc private func addPost() {
        let postAddVC = PostAddViewController.storyboardInstance()
        postAddVC.delegate = self
        self.navigationController?.pushViewController(postAddVC, animated: true)
    }

}

extension DashboardViewController: DashboardControllerDelegate {
    func setModel(posts: [PostUIModel]) {
        self.posts = posts
        self.tableView.reloadData()
    }
}

extension DashboardViewController: PostAddedDelegate {
    func postAdded(_ post: PostUIModel) {
        self.posts.append(post)
        self.tableView.reloadData()
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DashboardTableViewCell
        cell?.setup(item: posts[indexPath.row])
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailPostVC = PostDetailViewController.storyboardInstance(with: posts[indexPath.row])
        self.navigationController?.pushViewController(detailPostVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
