//
//  GetGithubsListRepositoryProtocol.swift
//  PopGithubReposBusinessLogic
//
//  Created by Thibaut Coutard on 19/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
public protocol GetGithubsListRepositoryProtocol: class {
    var output: GetGithubsListRepositoryOutput? { get set }
    func getiOSRepositories()
}

// sourcery: AutoMockable
public protocol GetGithubsListRepositoryOutput: class {
    func didGet(githubs: [GetGithubsListRepositoryResponseProtocol])
    func didHandleError()
}

public enum GetGithubsListRepositoryError {
    case unknown
    case network
    case server
}

// sourcery: AutoMockable
public protocol GetGithubsListRepositoryResponseProtocol {
    var name: String { get }
    var author: String { get }
    var license: String { get }
    var contributorsCount: Int { get }
    var starsCount: Int { get }
}
