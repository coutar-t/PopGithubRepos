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
    @IBOutlet weak var isIOSSwitch: UISwitch!
    @IBOutlet weak var isIOSSwitchLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!

    var presenter: GithubsListPresenterInput!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
        githubsTableView.dataSource = self
        githubsTableView.delegate = self
        searchTextField.delegate = self
    }

    @IBAction func isIOSSwitchToggled(_ sender: Any) {
        presenter.toggleSwitch()
    }
}

extension GithubsListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        presenter.didTypeSearch(with: searchTextField.text ?? "")
    }
}

extension GithubsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapRow(for: indexPath.row, at: indexPath.section)
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
    func setSearchText(text: String) {
        searchTextField.text = ""
    }

    func setTitle(title: String) {
        self.title = title
    }

    func setSearchPlaceholder(placeholder: String) {
        self.searchTextField.placeholder = placeholder
    }

    func setSwitchText(text: NSAttributedString) {
        isIOSSwitchLabel.attributedText = text
    }

    func showLoading() {
        indicator.startAnimating()
        indicator.isHidden = false
        githubsTableView.isHidden = true
    }

    func hideLoading() {
        indicator.stopAnimating()
        indicator.isHidden = true
        githubsTableView.isHidden = false
    }

    func updateGithubs() {
        githubsTableView.reloadData()
    }
    
    func showError(with message: String, retryMessage: String) {
        let alertView = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: retryMessage, style: .default, handler: { [weak self] (_) in
            self?.presenter.viewDidLoad()
        }))

        self.present(alertView, animated: true, completion: nil)
    }
}
