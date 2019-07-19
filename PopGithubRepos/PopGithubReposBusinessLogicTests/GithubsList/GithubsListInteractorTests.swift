//
//  GithubsListInteractorTests.swift
//  PopGithubReposBusinessLogicTests
//
//  Created by Thibaut Coutard on 19/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
//import Nimble
@testable import PopGithubReposBusinessLogic

class GithubsListInteractorTests: XCTestCase {
    var interactor: GithubsListInteractor!
    private var repositoryMock: GetGithubsListRepositoryProtocolMock!
    private var outputMock: GithubsListInteractorOutputMock!

    override func setUp() {
        repositoryMock = GetGithubsListRepositoryProtocolMock()
        outputMock = GithubsListInteractorOutputMock()
        interactor = GithubsListInteractor(getGithubsListRepository: repositoryMock)
        interactor.output = outputMock
    }

    // MARK: - interactor.retrieve

    func test_whenInteractorRetrieve_thenRepositoryGetCalled() {
        // When

        interactor.retrieve()

        // Then

        XCTAssert(repositoryMock.getiOSRepositoriesCalled)
        XCTAssert(repositoryMock.getiOSRepositoriesCallsCount == 1)
    }

    // MARK: - interactor.numberOfCategories

    func test_givenRepositories_whenNumberOfCategories_thenReturnOne() {
        // Given

        interactor.didGet(githubs: [GetGithubsListRepositoryResponseMock(name: "Repo1",
                                                                         author: "Author",
                                                                         license: "License",
                                                                         contributorsCount: 2,
                                                                         starsCount: 2)])

        // When

        let categories = interactor.numberOfCategories()

        // Then

        XCTAssert(categories == 1)
    }

    func test_givenNoRepositories_whenNumberOfCategories_thenReturnZero() {
        // When

        let categories = interactor.numberOfCategories()

        // Then

        XCTAssert(categories == 0)
    }

    // MARK: - interactor.numberOfGithubs

    func test_givenRepositories_whenNumberOfItemsAtGoodIndex_thenReturnRepositoriesCount() {
        // Given

        interactor.didGet(githubs: [GetGithubsListRepositoryResponseMock(name: "Repo1",
                                                                         author: "Author",
                                                                         license: "License",
                                                                         contributorsCount: 2,
                                                                         starsCount: 2)])

        // When

        let numberOfItems = interactor.numberOfGithubs(at: 0)

        // Then

        XCTAssert(numberOfItems == 1)
    }

    func test_givenRepositories_whenNumberOfItemsAtWrongIndex_thenReturnRepositoriesCount() {
        // Given

        interactor.didGet(githubs: [GetGithubsListRepositoryResponseMock(name: "Repo1",
                                                                         author: "Author",
                                                                         license: "License",
                                                                         contributorsCount: 2,
                                                                         starsCount: 2)])

        // When

        let numberOfItems = interactor.numberOfGithubs(at: 1)

        // Then

        XCTAssert(numberOfItems == 0)
    }

    // MARK: - interactor.github

    func test_givenRepositories_whenGithubForGoodIndex_thenReturnGithub() {
        // Given

        interactor.didGet(githubs: [GetGithubsListRepositoryResponseMock(name: "Repo1",
                                                                         author: "Author",
                                                                         license: "License",
                                                                         contributorsCount: 2,
                                                                         starsCount: 2)])

        // When

        let item = interactor.github(for: 0, at: 0)

        // Then

        XCTAssert(item?.name == "Repo1")
        XCTAssert(item?.author == "Author")
        XCTAssert(item?.license == "License")
        XCTAssert(item?.contributorsCount == 2)
        XCTAssert(item?.starsCount == 2)
    }

    func test_whenDidGet_thenOutputUpdateGithubsList() {
        // When

        interactor.didGet(githubs: [GetGithubsListRepositoryResponseMock(name: "Repo1",
                                                                         author: "Author",
                                                                         license: "License",
                                                                         contributorsCount: 2,
                                                                         starsCount: 2)])

        // Then

        XCTAssert(outputMock.updateGithubsListCallsCount == 1)
        XCTAssertFalse(outputMock.notifyServerErrorCalled)
        XCTAssertFalse(outputMock.setDefaultsValuesCalled)
        XCTAssertFalse(outputMock.notifyNetworkErrorCalled)
        XCTAssertFalse(outputMock.notifyUnknownErrorCalled)
    }
}

private struct GetGithubsListRepositoryResponseMock: GetGithubsListRepositoryResponse {
    var name: String
    var author: String
    var license: String
    var contributorsCount: Int
    var starsCount: Int
}

private class GetGithubsListRepositoryProtocolMock: GetGithubsListRepositoryProtocol {
    var output: GetGithubsListRepositoryOutput?
    var getiOSRepositoriesCallsCount = 0
    var getiOSRepositoriesCalled: Bool { return getiOSRepositoriesCallsCount > 0 }

    func getiOSRepositories() {
        getiOSRepositoriesCallsCount += 1
    }
}

private class GithubsListInteractorOutputMock: GithubsListInteractorOutput {
    var setDefaultsValuesCallsCount = 0
    var updateGithubsListCallsCount = 0
    var notifyServerErrorCallsCount = 0
    var notifyNetworkErrorCallsCount = 0
    var notifyUnknownErrorCallsCount = 0

    var setDefaultsValuesCalled: Bool { return setDefaultsValuesCallsCount > 0 }
    var updateGithubsListCalled: Bool { return updateGithubsListCallsCount > 0 }
    var notifyServerErrorCalled: Bool { return notifyServerErrorCallsCount > 0 }
    var notifyNetworkErrorCalled: Bool { return notifyNetworkErrorCallsCount > 0 }
    var notifyUnknownErrorCalled: Bool { return notifyUnknownErrorCallsCount > 0 }


    func setDefaultsValues() {
        setDefaultsValuesCallsCount += 1
    }

    func updateGithubsList() {
        updateGithubsListCallsCount += 1
    }

    func notifyServerError() {
        notifyServerErrorCallsCount += 1
    }

    func notifyNetworkError() {
        notifyNetworkErrorCallsCount += 1
    }

    func notifyUnknownError() {
        notifyUnknownErrorCallsCount += 1
    }
}
