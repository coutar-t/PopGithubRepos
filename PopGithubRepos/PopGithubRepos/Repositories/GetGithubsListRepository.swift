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
        GithubAPIWrapper.shared.getiOSRepositories(success: { [weak self] (repositoriesList) in
            self?.output?.didGet(githubs: repositoriesList.items?.compactMap({
                guard let name = $0.name,
                    let author = $0.owner?.login,
    let license = $0.license?.name,
                    let stars = $0.stargazers_count else { return nil }
                return GetGithubsListRepositoryResponse(name: name, author: author, license: name, contributorsCount: 0, starsCount: stars)
            }) ?? [])
        }) { (error) in
            print(error)
        }
    }
}

private struct GetGithubsListRepositoryResponse: GetGithubsListRepositoryResponseProtocol {
    var name: String
    var author: String
    var license: String
    var contributorsCount: Int
    var starsCount: Int
}
