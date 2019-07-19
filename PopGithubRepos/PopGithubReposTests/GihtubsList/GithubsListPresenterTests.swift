//
//  GithubsListPresenterTests.swift
//  PopGithubReposTests
//
//  Created by Thibaut Coutard on 19/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
import PopGithubReposBusinessLogic
import Nimble
@testable import PopGithubRepos

class GithubsListPresenterTests: XCTest {
    var presenter: GithubsListPresenter!
    var interactorMock: GithubsListInteractorInputMock!
    var outputMock: GithubsListPresenterOutputMock!

    override func setUp() {
        interactorMock = GithubsListInteractorInputMock()
        outputMock = GithubsListPresenterOutputMock()
        presenter = GithubsListPresenter(interactor: interactorMock)
        presenter.output = outputMock
    }

    func test_whenViewDidLoad_thenInteractorRetrieve() {
        // When

        presenter.viewDidLoad()

        // Then

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())

        expect(self.interactorMock.retrieveCallsCount).to(equal(1))
        expect(self.interactorMock.githubForAtCalled).to(beFalse())
        expect(self.interactorMock.numberOfGithubsAtCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
    }
}
