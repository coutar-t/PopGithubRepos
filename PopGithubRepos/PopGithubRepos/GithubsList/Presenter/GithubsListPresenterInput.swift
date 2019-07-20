//
//  GithubsListPresenterInput.swift
//  PopGithubRepos
//
//  Created by Thibaut Coutard on 19/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
public protocol GithubsListPresenterInput: class {
    var output: GithubsListPresenterOutput? { get set }
    func viewDidLoad()
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func viewModel(for row: Int, at section: Int) -> GithubViewModelProtocol
    func didTapRow(for row: Int, at section: Int)
    func didRefreshAndroid()
    func didRefreshiOS()
    func didTypeSearch(with input: String)
}

// sourcery: AutoMockable
public protocol GithubViewModelProtocol {
    var name: NSAttributedString { get }
    var author: NSAttributedString { get }
    var license: NSAttributedString { get }
    var contributors: NSAttributedString { get }
    var starsCount: NSAttributedString { get }
}
