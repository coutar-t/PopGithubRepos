//
//  GihtubDetailInteractorModuleFactory.swift
//  PopGithubReposBusinessLogic
//
//  Created by Thibaut Coutard on 20/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockableBusinessLogic
public protocol GithubDetailInteractorModuleFactoryProtocol {
    func interactor() -> GithubDetailInteractorInput
}

public class GithubDetailInteractorModuleFactory: GithubDetailInteractorModuleFactoryProtocol {
    public init() {}
    public func interactor() -> GithubDetailInteractorInput {
        let interactor = GithubDetailInteractor(repository: CurrentGithubRepository.shared)
        CurrentGithubRepository.shared.output = interactor
        return interactor
    }
}
