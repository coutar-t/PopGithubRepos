//
//  GithubDetailInteractorTests.swift
//  PopGithubReposBusinessLogicTests
//
//  Created by Thibaut Coutard on 20/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
@testable import PopGithubReposBusinessLogic

class GithubDetailInteractorTests: XCTestCase {
    var interactor: GithubDetailInteractor!
    var repository: CurrentGithubRepositoryProtocolMock!
    var output: GithubDetailInteractorOutputMock!

    override func setUp() {
        repository = CurrentGithubRepositoryProtocolMock()
        output = GithubDetailInteractorOutputMock()

        interactor = GithubDetailInteractor(repository: repository)
        interactor.output = output
    }

    func test_whenRetrieve_thenRepositoryGet() {
        // When

        interactor.retrieve()

        // Then

        XCTAssert(output.setDefaultsValuesCallsCount == 1)
        XCTAssert(output.notifyLoadingCallsCount == 1)
        XCTAssertFalse(output.routeBackCalled)
        XCTAssertFalse(output.notifyNoDataErrorCalled)
        XCTAssertFalse(output.updateGithubGithubCalled)

        XCTAssert(repository.getCallsCount == 1)
        XCTAssertFalse(repository.clearCalled)
        XCTAssertFalse(repository.saveCurrentGithubCalled)
    }

    func test_whenRouteBack_thenOutputRouteBack() {
        // When

        interactor.routeBack()

        // Then

        XCTAssert(output.routeBackCallsCount == 1)
        XCTAssertFalse(output.updateGithubGithubCalled)
        XCTAssertFalse(output.notifyNoDataErrorCalled)
        XCTAssertFalse(output.notifyLoadingCalled)
        XCTAssertFalse(output.setDefaultsValuesCalled)

        XCTAssert(repository.clearCallsCount == 1)
        XCTAssertFalse(repository.getCalled)
        XCTAssertFalse(repository.saveCurrentGithubCalled)
    }

    func test_whenDidGet_thenOutputUpdateGithub() {
        // When

        interactor.didGet(github: CurrentGithubRepositoryResponseProtocolMock(name: "Name",
                                                                      author: "Author",
                                                                      license: "License",
                                                                      contributorsCount: 2,
                                                                      starsCount: 3))

        // Then

        XCTAssert(output.updateGithubGithubCallsCount == 1)
        XCTAssert(output.updateGithubGithubReceivedGithub?.name == "Name")
        XCTAssert(output.updateGithubGithubReceivedGithub?.author == "Author")
        XCTAssert(output.updateGithubGithubReceivedGithub?.license == "License")
        XCTAssert(output.updateGithubGithubReceivedGithub?.contributorsCount == 2)
        XCTAssert(output.updateGithubGithubReceivedGithub?.starsCount == 3)

        XCTAssertFalse(output.routeBackCalled)
        XCTAssertFalse(output.notifyNoDataErrorCalled)
        XCTAssertFalse(output.notifyLoadingCalled)
        XCTAssertFalse(output.setDefaultsValuesCalled)

        XCTAssertFalse(repository.clearCalled)
        XCTAssertFalse(repository.getCalled)
        XCTAssertFalse(repository.saveCurrentGithubCalled)
    }

    func test_whenDidHandleError_thenOutputNotifyNoData() {
        // When

        interactor.didHandleError()

        // Then

        XCTAssertFalse(output.updateGithubGithubCalled)
        XCTAssertFalse(output.routeBackCalled)
        XCTAssert(output.notifyNoDataErrorCallsCount == 1)
        XCTAssertFalse(output.notifyLoadingCalled)
        XCTAssertFalse(output.setDefaultsValuesCalled)

        XCTAssertFalse(repository.clearCalled)
        XCTAssertFalse(repository.getCalled)
        XCTAssertFalse(repository.saveCurrentGithubCalled)
    }
}
