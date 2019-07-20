//
//  GithubsListInteractorModuleFactory.swift
//  PopGithubReposBusinessLogic
//
//  Created by Thibaut Coutard on 19/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockableBusinessLogic
public protocol GithubsListInteractorModuleFactoryProtocol {
    func interactor(getGithubsListRepository: GetGithubsListRepositoryProtocol) -> GithubsListInteractorInput
}

public class GithubsListInteractorModuleFactory: GithubsListInteractorModuleFactoryProtocol {
    public init() {}
    public func interactor(getGithubsListRepository: GetGithubsListRepositoryProtocol) -> GithubsListInteractorInput {
        let interactor = GithubsListInteractor(getGithubsListRepository: getGithubsListRepository,
                                               currentGithubRepository: CurrentGithubRepository.shared)
        getGithubsListRepository.output = interactor
        return interactor
    }
}
