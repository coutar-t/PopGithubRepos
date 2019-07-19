//
//  GithubsListViewController.swift
//  PopGithubRepos
//
//  Created by Thibaut Coutard on 19/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import UIKit

class GithubsListViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var githubsTableView: UITableView!

    var presenter: GithubsListPresenterInput!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
        githubsTableView.dataSource = self
    }
}

extension GithubsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(in: section)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "githubCell", for: indexPath) as! GithubsListTableViewCell
        cell.setViewModel(viewModel: presenter.viewModel(for: indexPath.row, at: indexPath.section))
        return cell

    }
}

extension GithubsListViewController: GithubsListPresenterOutput {
    func setTitle(title: String) {
        self.title = title
    }

    func showLoading() {
        indicator.startAnimating()
        indicator.isHidden = false
    }

    func hideLoading() {
        indicator.stopAnimating()
        indicator.isHidden = true
    }

    func updateGithubs() {
        githubsTableView.reloadData()
    }
    
    func showError(with message: String, retryMessage: String) {
        let alertView = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: retryMessage, style: .default, handler: { [weak self] (_) in
            self?.presenter.viewDidLoad()
        }))
    }
}
