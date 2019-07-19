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
    private var repositories: [GithubItemProtocol] = []

    init(getGithubsListRepository: GetGithubsListRepositoryProtocol) {
        self.getGithubsListRepository = getGithubsListRepository
        getGithubsListRepository.output = self
    }
}

extension GithubsListInteractor: GithubsListInteractorInput {
    
    func retrieve() {
        getGithubsListRepository.getiOSRepositories()
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
}

extension GithubsListInteractor: GetGithubsListRepositoryOutput {
    func didGet(githubs: [GetGithubsListRepositoryResponse]) {
        repositories = githubs.map({ GithubItem(name: $0.name,
                                                author: $0.author,
                                                license: $0.license,
                                                contributorsCount: $0.contributorsCount,
                                                starsCount: $0.starsCount) })
        output?.updateGithubsList()
    }

    func didHandleError() {
    }
}

private struct GithubItem: GithubItemProtocol {
    var name: String
    var author: String
    var license: String
    var contributorsCount: Int
    var starsCount: Int
}
