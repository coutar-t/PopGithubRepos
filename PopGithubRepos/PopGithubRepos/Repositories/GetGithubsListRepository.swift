//
//  GetGithubsListRepository.swift
//  PopGithubRepos
//
//  Created by Thibaut Coutard on 19/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import PopGithubReposBusinessLogic

class GetGithubsListRepository: GetGithubsListRepositoryProtocol {
    var output: GetGithubsListRepositoryOutput?

    func getiOSRepositories() {
        output?.didGet(githubs: [GetGithubsListRepositoryResponse(name: "Repo1", author: "Author", license: "OpenSource", contributorsCount: 2, starsCount: 3),
            GetGithubsListRepositoryResponse(name: "Repo2", author: "Author", license: "OpenSource", contributorsCount: 2, starsCount: 3),
            GetGithubsListRepositoryResponse(name: "Repo3", author: "Author", license: "OpenSource", contributorsCount: 2, starsCount: 3),GetGithubsListRepositoryResponse(name: "Repo4", author: "Author", license: "OpenSource", contributorsCount: 2, starsCount: 3)])
    }
}

private struct GetGithubsListRepositoryResponse: GetGithubsListRepositoryResponseProtocol {
    var name: String
    var author: String
    var license: String
    var contributorsCount: Int
    var starsCount: Int
}
