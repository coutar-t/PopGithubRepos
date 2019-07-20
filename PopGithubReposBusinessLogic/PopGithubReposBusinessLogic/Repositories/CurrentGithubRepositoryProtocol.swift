//
//  CurrentGithubRepositoryProtocol.swift
//  PopGithubReposBusinessLogic
//
//  Created by Thibaut Coutard on 20/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockableBusinessLogic
public protocol CurrentGithubRepositoryProtocol: class {
    var output: CurrentGithubRepositoryOutput? { get set }
    func get()
    func save(currentGithub: CurrentGithubRepositoryRequestProtocol)
    func clear()
}

// sourcery: AutoMockableBusinessLogic
public protocol CurrentGithubRepositoryOutput: class {
    func didGet(github: CurrentGithubRepositoryResponseProtocol)
    func didHandleError()
}

// sourcery: AutoMockableBusinessLogic
public protocol CurrentGithubRepositoryResponseProtocol {
    var name: String { get }
    var author: String { get }
    var license: String { get }
    var contributorsCount: Int { get }
    var starsCount: Int { get }
}

// sourcery: AutoMockableBusinessLogic
public protocol CurrentGithubRepositoryRequestProtocol {
    var name: String { get }
    var author: String { get }
    var license: String { get }
    var contributorsCount: Int { get }
    var starsCount: Int { get }
}
