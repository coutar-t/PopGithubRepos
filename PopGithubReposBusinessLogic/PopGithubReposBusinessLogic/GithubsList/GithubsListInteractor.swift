//
//  GithubsListInteractor.swift
//  PopGithubReposBusinessLogic
//
//  Created by Thibaut Coutard on 19/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

class GithubsListInteractor {
    weak var output: GithubsListInteractorOutput?
    private var getGithubsListRepository: GetGithubsListRepositoryProtocol
    private var currentGithubRepository: CurrentGithubRepositoryProtocol
    private var repositories: [GithubItemProtocol] = []

    init(getGithubsListRepository: GetGithubsListRepositoryProtocol, currentGithubRepository: CurrentGithubRepositoryProtocol) {
        self.getGithubsListRepository = getGithubsListRepository
        self.currentGithubRepository = currentGithubRepository
    }
}

extension GithubsListInteractor: GithubsListInteractorInput {
    
    func retrieve() {
        retrieveiOS()
        output?.setDefaultsValues()
    }

    func numberOfCategories() -> Int {
        if repositories.count == 0 {
            return 0
        }
        return 1
    }

    func numberOfGithubs(at categoryIndex: Int) -> Int {
        guard categoryIndex == 0 else {
            return 0
        }
        return repositories.count
    }
    
    func github(for index: Int, at categoryIndex: Int) -> GithubItemProtocol? {
        guard categoryIndex == 0, index < repositories.count else { return nil }
        return repositories[index]
    }

    func didSelectGithub(for index: Int, at categoryIndex: Int) {
        guard categoryIndex == 0, index < repositories.count else { return  }

        let repository = repositories[index]

        currentGithubRepository.save(currentGithub: CurrentGithubRepositoryRequest(name: repository.name,
                                                                                   author: repository.author,
                                                                                   license: repository.license,
                                                                                   contributorsCount: repository.contributorsCount,
                                                                                   starsCount: repository.starsCount))
        output?.routeToDetails()
    }

    func retrieveAndroid() {
        getGithubsListRepository.getAndroidRepositories()
        output?.notifyLoading()
    }
    func retrieveiOS() {
        getGithubsListRepository.getiOSRepositories()
        output?.notifyLoading()
    }
}

extension GithubsListInteractor: GetGithubsListRepositoryOutput {
    func didGet(githubs: [GetGithubsListRepositoryResponseProtocol]) {
        repositories = githubs.map({ GithubItem(name: $0.name,
                                                author: $0.author,
                                                license: $0.license,
                                                contributorsCount: $0.contributorsCount,
                                                starsCount: $0.starsCount) })
        output?.updateGithubsList()
    }

    func didHandleError() {
        output?.notifyUnknownError()
    }
}

private struct CurrentGithubRepositoryRequest: CurrentGithubRepositoryRequestProtocol {
    var name: String
    var author: String
    var license: String
    var contributorsCount: Int
    var starsCount: Int
}

private struct GithubItem: GithubItemProtocol {
    var name: String
    var author: String
    var license: String
    var contributorsCount: Int
    var starsCount: Int
}
