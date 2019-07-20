//
//  GihtubDetailInteractorOutput.swift
//  PopGithubReposBusinessLogic
//
//  Created by Thibaut Coutard on 20/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockableBusinessLogic
public protocol GithubDetailInteractorOutput: class {
    func setDefaultsValues()
    func updateGithub(github: GithubDetailItemProtocol)
    func notifyLoading()
    func notifyNoDataError()
    func routeBack()
}

// sourcery: AutoMockableBusinessLogic
public protocol GithubDetailItemProtocol {
    var name: String { get }
    var author: String { get }
    var license: String { get }
    var contributorsCount: Int { get }
    var starsCount: Int { get }
}
