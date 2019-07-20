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

        interactor.didGet(githubs: [GetGithubsListRepositoryResponseProtocolMock(name: "Repo1",
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

        interactor.didGet(githubs: [GetGithubsListRepositoryResponseProtocolMock(name: "Repo1",
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

        interactor.didGet(githubs: [GetGithubsListRepositoryResponseProtocolMock(name: "Repo1",
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

        interactor.didGet(githubs: [GetGithubsListRepositoryResponseProtocolMock(name: "Repo1",
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

        interactor.didGet(githubs: [GetGithubsListRepositoryResponseProtocolMock(name: "Repo1",
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
