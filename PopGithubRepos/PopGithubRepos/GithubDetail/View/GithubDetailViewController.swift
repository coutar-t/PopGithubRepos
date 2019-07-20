//
//  GithubDetailViewController.swift
//  PopGithubRepos
//
//  Created by Thibaut Coutard on 20/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import UIKit

class GithubDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var contributorsLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var presenter: GithubDetailPresenterInput!


    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        let backButton = UIBarButtonItem(title: "<", style: .done, target: self, action: #selector(routeBack))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.hidesBackButton = true
    }
    @objc
    func routeBack() {
        presenter.didTapBack()
    }
}

extension GithubDetailViewController: GithubDetailPresenterOutput {
    func setTitle(title: String) {
        self.title = title
    }

    func showError(message: String, backButton: String) {
        let alertView = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: backButton, style: .default, handler: { [weak self] (_) in
            self?.presenter.didTapBack()
        }))

        self.present(alertView, animated: true, completion: nil)
    }

    func showLoading() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }

    func hideLoading() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }

    func updateGithub(github: GithubDetailViewModelProtocol) {
        titleLabel.attributedText = github.name
        authorLabel.attributedText = github.author
        starsLabel.attributedText = github.starsCount
        contributorsLabel.attributedText = github.contributors
    }
}
