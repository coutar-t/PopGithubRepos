//
//  GithubsListTableViewCell.swift
//  PopGithubRepos
//
//  Created by Thibaut Coutard on 19/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import UIKit

class GithubsListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var contributorsLabel: UILabel!
    @IBOutlet weak var licenseLabel: UILabel!

    func setViewModel(viewModel: GithubViewModelProtocol) {
        titleLabel.attributedText = viewModel.name
        authorLabel.attributedText = viewModel.author
        starsLabel.attributedText = viewModel.starsCount
        contributorsLabel.attributedText = viewModel.contributors
        licenseLabel.attributedText = viewModel.license
    }
}
