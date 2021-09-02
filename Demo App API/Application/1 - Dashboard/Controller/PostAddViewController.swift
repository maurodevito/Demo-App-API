//
//  PostAddViewController.swift
//  Demo App API
//
//  Created by Mauro De Vito on 02/09/2021.
//

import UIKit

protocol PostAddedDelegate {
    func postAdded(_ post: PostUIModel)
}
class PostAddViewController: BaseViewController<PostAddManager> {
    
    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var delegate: PostAddedDelegate?
    
    static func storyboardInstance() -> PostAddViewController {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let viewController = (storyboard.instantiateViewController(withIdentifier: "postAddStoryboardID") as? PostAddViewController)!
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager.viewControllerDelegate = self
    }
    
    @IBAction func buttonPressed(){
        if let userIdStr = self.userIdTextField.text, let title = self.titleTextField.text, let body = self.bodyTextView.text, let userId = UInt(userIdStr) {
            self.manager.addPost(userId: userId, title: title, body: body)
        } else {
            let alertController = UIAlertController(title: "Error", message: "Fill all fields", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
                // do something on cancel
            }
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}

extension PostAddViewController: PostAddControllerDelegate {
    func showError(error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
            // do something on cancel
        }
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func postAdded(post: PostUIModel) {
        self.delegate?.postAdded(post)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}


extension PostAddViewController: UITextFieldDelegate {
    
}

extension PostAddViewController: UITextViewDelegate {
    
}
