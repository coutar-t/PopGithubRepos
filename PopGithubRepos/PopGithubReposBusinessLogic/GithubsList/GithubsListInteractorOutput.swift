//
//  GithubsListInteractorOutput.swift
//  PopGithubReposBusinessLogic
//
//  Created by Thibaut Coutard on 19/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
public protocol GithubsListInteractorOutput: class {
    func setDefaultsValues()
    func updateGithubsList()
    func notifyServerError()
    func notifyNetworkError()
    func notifyUnknownError()
}
