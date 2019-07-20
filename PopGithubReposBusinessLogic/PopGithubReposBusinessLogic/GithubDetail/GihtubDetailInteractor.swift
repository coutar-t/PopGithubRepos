//
//  File.swift
//  PopGithubReposBusinessLogic
//
//  Created by Thibaut Coutard on 20/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

class GithubDetailInteractor {
    weak var output: GithubDetailInteractorOutput?
    private var repository: CurrentGithubRepositoryProtocol

    init(repository: CurrentGithubRepositoryProtocol) {
        self.repository = repository
    }
}

extension GithubDetailInteractor: GithubDetailInteractorInput {
    func retrieve() {
        output?.setDefaultsValues()
        output?.notifyLoading()
        repository.get()
    }

    func routeBack() {
        output?.routeBack()
        repository.clear()
    }
}

extension GithubDetailInteractor: CurrentGithubRepositoryOutput {
    func didGet(github: CurrentGithubRepositoryResponseProtocol) {
        output?.updateGithub(github: GithubDetailItem(name: github.name,
                                                      author: github.author,
                                                      license: github.license,
                                                      contributorsCount: github.contributorsCount,
                                                      starsCount: github.starsCount))
    }

    func didHandleError() {
        output?.notifyNoDataError()
    }
}

private struct GithubDetailItem: GithubDetailItemProtocol {
    var name: String
    var author: String
    var license: String
    var contributorsCount: Int
    var starsCount: Int
}
