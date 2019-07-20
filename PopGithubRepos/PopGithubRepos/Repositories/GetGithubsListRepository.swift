//
//  GetGithubsListRepository.swift
//  PopGithubRepos
//
//  Created by Thibaut Coutard on 19/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import PopGithubReposBusinessLogic

class GetGithubsListRepository {
    var output: GetGithubsListRepositoryOutput?

    private func onSuccess(repositoriesList: GithubRepositoriesList) {
        output?.didGet(githubs: repositoriesList.items?.compactMap({
            guard let name = $0.name,
                let author = $0.owner?.login,
                let license = $0.license?.name,
                let stars = $0.stargazers_count else { return nil }
            return GetGithubsListRepositoryResponse(name: name, author: author, license: license, contributorsCount: 0, starsCount: stars)
        }) ?? [])
    }

    private func onError(error: Error) {
        output?.didHandleError()
    }
}

extension GetGithubsListRepository: GetGithubsListRepositoryProtocol {
    func getiOSRepositories(with input: String?) {
        GithubAPIWrapper.shared.getiOSRepositories(with: input,
                                                   success: { [weak self] (repositoriesList) in
            self?.onSuccess(repositoriesList: repositoriesList)
        }) { [weak self] (error) in
            self?.onError(error: error)
        }
    }

    func getAndroidRepositories(with input: String?) {
        GithubAPIWrapper.shared.getAndroidRepositories(with: input,
                                                       success: { [weak self] (repositoriesList) in
            self?.onSuccess(repositoriesList: repositoriesList)
        }) { [weak self] (error) in
            self?.onError(error: error)
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
