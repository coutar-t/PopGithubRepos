//
//  CurrentGithubRepositoryTests.swift
//  PopGithubReposBusinessLogicTests
//
//  Created by Thibaut Coutard on 20/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
@testable import PopGithubReposBusinessLogic

class CurrentGithubRepositoryTests: XCTestCase {
    var repository: CurrentGithubRepository!
    var output: CurrentGithubRepositoryOutputMock!

    override func setUp() {
        output = CurrentGithubRepositoryOutputMock()
        repository = CurrentGithubRepository.shared
        repository.output = output
    }

    func test_givenNothingSaved_whenRepositoryGet_thenOutputDidHandleError() {
        // Given

        repository.clear()

        // When

        repository.save(currentGithub: CurrentGithubRepositoryRequestProtocolMock(name: "Name",
                                                                                  author: "Author",
                                                                                  license: "License",
                                                                                  contributorsCount: 0,
                                                                                  starsCount: 1))

        repository.get()

        // Then

        XCTAssert(output.didGetGithubReceivedGithub?.author == "Author")
        XCTAssert(output.didGetGithubReceivedGithub?.name == "Name")
        XCTAssert(output.didGetGithubReceivedGithub?.license == "License")
        XCTAssert(output.didGetGithubReceivedGithub?.contributorsCount == 0)
        XCTAssert(output.didGetGithubReceivedGithub?.starsCount == 1)
        XCTAssertFalse(output.didHandleErrorCalled)
        XCTAssert(output.didGetGithubCallsCount == 1)
    }

    func test_whenRepositoryClear_thenNothingIsSaved() {
        // When

        repository.clear()

        // When

        repository.get()

        // Then

        XCTAssert(output.didHandleErrorCallsCount == 1)
        XCTAssertFalse(output.didGetGithubCalled)
    }
}
