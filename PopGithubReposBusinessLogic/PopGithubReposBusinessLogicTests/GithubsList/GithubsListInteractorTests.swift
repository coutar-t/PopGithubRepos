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
    private var currentGithubRepositoryMock: CurrentGithubRepositoryProtocolMock!
    private var outputMock: GithubsListInteractorOutputMock!

    override func setUp() {
        repositoryMock = GetGithubsListRepositoryProtocolMock()
        outputMock = GithubsListInteractorOutputMock()
        currentGithubRepositoryMock = CurrentGithubRepositoryProtocolMock()
        interactor = GithubsListInteractor(getGithubsListRepository: repositoryMock,
                                           currentGithubRepository: currentGithubRepositoryMock)
        interactor.output = outputMock
    }

    // MARK: - interactor.retrieve

    func test_whenInteractorRetrieve_thenRepositoryGetCalled() {
        // When

        interactor.retrieve()

        // Then

        XCTAssertFalse(repositoryMock.getAndroidRepositoriesWithCalled)
        XCTAssert(outputMock.notifyLoadingCallsCount == 1)
        XCTAssert(outputMock.setDefaultsValuesCallsCount == 1)
        XCTAssertFalse(outputMock.routeToDetailsCalled)
        XCTAssertFalse(outputMock.notifyServerErrorCalled)
        XCTAssertFalse(outputMock.updateGithubsListCalled)
        XCTAssertFalse(outputMock.notifyNetworkErrorCalled)
        XCTAssertFalse(outputMock.notifyUnknownErrorCalled)
        XCTAssert(repositoryMock.getiOSRepositoriesWithCallsCount == 1)
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

    func test_whenDidSelectGithubGoodIndex_thenCurrentRepositorySave() {
        // Given
        interactor.didGet(githubs: [GetGithubsListRepositoryResponseProtocolMock(name: "Repo1",
                                                                                 author: "Author",
                                                                                 license: "License",
                                                                                 contributorsCount: 2,
                                                                                 starsCount: 2)])

        // When

        interactor.didSelectGithub(for: 0, at: 0)

        XCTAssert(outputMock.updateGithubsListCallsCount == 1)
        XCTAssert(outputMock.routeToDetailsCallsCount == 1)
        XCTAssertFalse(outputMock.notifyServerErrorCalled)
        XCTAssertFalse(outputMock.setDefaultsValuesCalled)
        XCTAssertFalse(outputMock.notifyNetworkErrorCalled)
        XCTAssertFalse(outputMock.notifyUnknownErrorCalled)

        XCTAssertFalse(repositoryMock.getiOSRepositoriesWithCalled)

        XCTAssertFalse(currentGithubRepositoryMock.clearCalled)
        XCTAssertFalse(currentGithubRepositoryMock.getCalled)
        XCTAssert(currentGithubRepositoryMock.saveCurrentGithubCallsCount == 1)
        XCTAssert(currentGithubRepositoryMock.saveCurrentGithubReceivedCurrentGithub?.name == "Repo1")
        XCTAssert(currentGithubRepositoryMock.saveCurrentGithubReceivedCurrentGithub?.author == "Author")
        XCTAssert(currentGithubRepositoryMock.saveCurrentGithubReceivedCurrentGithub?.license == "License")
        XCTAssert(currentGithubRepositoryMock.saveCurrentGithubReceivedCurrentGithub?.contributorsCount == 2)
        XCTAssert(currentGithubRepositoryMock.saveCurrentGithubReceivedCurrentGithub?.starsCount == 2)
    }

    func test_whenRetrieveAndroid_thenRepositoryRetrieveAndroid() {
        // When

        interactor.retrieveAndroid()

        // Then

        XCTAssertFalse(repositoryMock.getiOSRepositoriesWithCalled)
        XCTAssert(repositoryMock.getAndroidRepositoriesWithCallsCount == 1)

        XCTAssert(outputMock.notifyLoadingCallsCount == 1)
        XCTAssertFalse(outputMock.setDefaultsValuesCalled)
        XCTAssertFalse(outputMock.routeToDetailsCalled)
        XCTAssertFalse(outputMock.notifyServerErrorCalled)
        XCTAssertFalse(outputMock.updateGithubsListCalled)
        XCTAssertFalse(outputMock.notifyNetworkErrorCalled)
        XCTAssertFalse(outputMock.notifyUnknownErrorCalled)
    }

    func test_whenRetrieveiOS_thenRepositoryRetrieveiOS() {
        // When

        interactor.retrieveiOS()

        // Then

        XCTAssertFalse(repositoryMock.getAndroidRepositoriesWithCalled)
        XCTAssert(repositoryMock.getiOSRepositoriesWithCallsCount == 1)

        XCTAssert(outputMock.notifyLoadingCallsCount == 1)
        XCTAssertFalse(outputMock.setDefaultsValuesCalled)
        XCTAssertFalse(outputMock.routeToDetailsCalled)
        XCTAssertFalse(outputMock.notifyServerErrorCalled)
        XCTAssertFalse(outputMock.updateGithubsListCalled)
        XCTAssertFalse(outputMock.notifyNetworkErrorCalled)
        XCTAssertFalse(outputMock.notifyUnknownErrorCalled)
    }

    func test_whenDidHandleError_thenNotifyUnknownError() {
        // When

        interactor.didHandleError()

        // Then

        XCTAssertFalse(repositoryMock.getAndroidRepositoriesWithCalled)
        XCTAssertFalse(repositoryMock.getiOSRepositoriesWithCalled)

        XCTAssertFalse(outputMock.notifyLoadingCalled)
        XCTAssertFalse(outputMock.setDefaultsValuesCalled)
        XCTAssertFalse(outputMock.routeToDetailsCalled)
        XCTAssertFalse(outputMock.notifyServerErrorCalled)
        XCTAssertFalse(outputMock.updateGithubsListCalled)
        XCTAssertFalse(outputMock.notifyNetworkErrorCalled)
        XCTAssert(outputMock.notifyUnknownErrorCallsCount == 1)
    }

    func test_giveniOSSearch_whenSearch_thenRepositoryGetiOSRepository() {
        // Given

        interactor.retrieveiOS()

        // When

        interactor.search(for: "toto")

        // Then

        XCTAssertFalse(repositoryMock.getAndroidRepositoriesWithCalled)
        XCTAssert(repositoryMock.getiOSRepositoriesWithCallsCount == 2)
        XCTAssert(repositoryMock.getiOSRepositoriesWithReceivedInput == "toto")


        XCTAssert(outputMock.notifyLoadingCallsCount == 2)
        XCTAssertFalse(outputMock.setDefaultsValuesCalled)
        XCTAssertFalse(outputMock.routeToDetailsCalled)
        XCTAssertFalse(outputMock.notifyServerErrorCalled)
        XCTAssertFalse(outputMock.updateGithubsListCalled)
        XCTAssertFalse(outputMock.notifyNetworkErrorCalled)
        XCTAssertFalse(outputMock.notifyUnknownErrorCalled)
    }

    func test_givenAndroidSearch_whenSearch_thenRepositoryGetiOSRepository() {
        // Given

        interactor.retrieveAndroid()

        // When

        interactor.search(for: "toto")

        // Then

        XCTAssertFalse(repositoryMock.getiOSRepositoriesWithCalled)
        XCTAssert(repositoryMock.getAndroidRepositoriesWithCallsCount == 2)
        XCTAssert(repositoryMock.getAndroidRepositoriesWithReceivedInput == "toto")

        XCTAssert(outputMock.notifyLoadingCallsCount == 2)
        XCTAssertFalse(outputMock.setDefaultsValuesCalled)
        XCTAssertFalse(outputMock.routeToDetailsCalled)
        XCTAssertFalse(outputMock.notifyServerErrorCalled)
        XCTAssertFalse(outputMock.updateGithubsListCalled)
        XCTAssertFalse(outputMock.notifyNetworkErrorCalled)
        XCTAssertFalse(outputMock.notifyUnknownErrorCalled)
    }
}
