//
//  BaseViewController.swift
//  Demo App API
//
//  Created by Mauro De Vito on 01/09/2021.
//

import UIKit

protocol BaseControllerDelegate: class {
    func showLoader()
    func hideLoader()
}

class BaseViewController <T: BaseManager>: UIViewController, BaseControllerDelegate {
    var manager: T
    var spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    var loadingView: UIView = UIView()

    required init(mng: T) {
        manager = mng
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        manager = T()
        super.init(coder: aDecoder)
    }

    func showLoader() {
        self.loadingView = UIView()
        self.loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        self.loadingView.center = self.view.center
        self.loadingView.backgroundColor = .gray
        self.loadingView.alpha = 0.7
        self.loadingView.clipsToBounds = true
        self.loadingView.layer.cornerRadius = 10

        self.spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        self.spinner.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
        let xPos = self.loadingView.bounds.size.width / 2
        let yPos = self.loadingView.bounds.size.height / 2

        self.spinner.center = CGPoint(x: xPos, y: yPos)

        self.loadingView.addSubview(self.spinner)
        self.view.addSubview(self.loadingView)
        self.spinner.startAnimating()
    }

    func hideLoader() {
        self.spinner.stopAnimating()
        self.loadingView.removeFromSuperview()
    }

}
