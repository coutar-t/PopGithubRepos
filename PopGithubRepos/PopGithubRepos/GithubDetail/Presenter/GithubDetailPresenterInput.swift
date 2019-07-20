//
//  GithubDetailPresenterInput.swift
//  PopGithubRepos
//
//  Created by Thibaut Coutard on 20/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
public protocol GithubDetailPresenterInput {
    var output: GithubDetailPresenterOutput? { get set }
    func viewDidLoad()
    func didTapBack()
}
