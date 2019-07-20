//
//  GithubDetailPresenterOutput.swift
//  PopGithubRepos
//
//  Created by Thibaut Coutard on 20/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
public protocol GithubDetailPresenterOutput {
    func setTitle(title: String)
    func showError(message: String, backButton: String)
    func showLoading()
    func hideLoading()
    func updateGithub(github: GithubDetailViewModelProtocol)
}

// sourcery: AutoMockable
public protocol GithubDetailViewModelProtocol {
    var name: NSAttributedString { get }
    var author: NSAttributedString { get }
    var license: NSAttributedString { get }
    var contributors: NSAttributedString { get }
    var starsCount: NSAttributedString { get }
}
