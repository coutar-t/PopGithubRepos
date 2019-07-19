//
//  GithubsListInteractorInput.swift
//  PopGithubReposBusinessLogic
//
//  Created by Thibaut Coutard on 19/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
public protocol GithubsListInteractorInput: class {
    var output: GithubsListInteractorOutput? { get set }
    func retrieve()
    func numberOfCategories() -> Int
    func numberOfGithubs(at categoryIndex: Int) -> Int
    func github(for index: Int, at categoryIndex: Int) -> GithubItemProtocol?
}

// sourcery: AutoMockable
public protocol GithubItemProtocol {
    var name: String { get }
    var author: String { get }
    var license: String { get }
    var contributorsCount: Int { get }
    var starsCount: Int { get }
}
