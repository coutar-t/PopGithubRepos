//
//  GithubsListPresenterOuput.swift
//  PopGithubRepos
//
//  Created by Thibaut Coutard on 19/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
public protocol GithubsListPresenterOutput: class {
    func setTitle(title: String)
    func setSwitchText(text: NSAttributedString)
    func showLoading()
    func hideLoading()
    func updateGithubs()
    func showError(with message: String, retryMessage: String)
}
