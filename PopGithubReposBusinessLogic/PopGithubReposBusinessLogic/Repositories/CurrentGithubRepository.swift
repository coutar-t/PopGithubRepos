//
//  CurrentGithubRepository.swift
//  PopGithubReposBusinessLogic
//
//  Created by Thibaut Coutard on 20/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

class CurrentGithubRepository: CurrentGithubRepositoryProtocol {
    weak var output: CurrentGithubRepositoryOutput?
    private var currentGithub: CurrentGithubRepositoryResponseProtocol?

    private init() {}

    static let shared = CurrentGithubRepository()

    func get() {
        guard let currentGithub = self.currentGithub else {
            self.output?.didHandleError()
            return
        }
        self.output?.didGet(github: currentGithub)
    }

    func save(currentGithub request: CurrentGithubRepositoryRequestProtocol) {
        self.currentGithub = CurrentGithubRepositoryResponse(name: request.name,
                                                             author: request.author,
                                                             license: request.license,
                                                             contributorsCount: request.contributorsCount,
                                                             starsCount: request.starsCount)
    }

    func clear() {
        self.currentGithub = nil
    }

}

private struct CurrentGithubRepositoryResponse: CurrentGithubRepositoryResponseProtocol {
    var name: String
    var author: String
    var license: String
    var contributorsCount: Int
    var starsCount: Int
}
