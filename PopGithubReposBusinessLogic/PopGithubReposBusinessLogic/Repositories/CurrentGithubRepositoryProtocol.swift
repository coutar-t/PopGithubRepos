//
//  CurrentGithubRepositoryProtocol.swift
//  PopGithubReposBusinessLogic
//
//  Created by Thibaut Coutard on 20/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

public protocol CurrentGithubRepositoryProtocol: class {
    var output: CurrentGithubRepositoryOutput? { get set }
    func get()
}

public protocol CurrentGithubRepositoryOutput: class {
    func didGet(github: CurrentGithubRepositoryResponseProtocol)
    func didHandleError()
}

public protocol CurrentGithubRepositoryResponseProtocol {
    var name: String { get }
    var author: String { get }
    var license: String { get }
    var contributorsCount: Int { get }
    var starsCount: Int { get }
}
