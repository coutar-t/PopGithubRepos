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

class GithubsListPresenterTests: XCTestCase {
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

    func test_whenNumberOfSections_thenInteractorNumberOfCategories() {
        // Given

        interactorMock.numberOfCategoriesReturnValue = 2

        // When

        let categories = presenter.numberOfSections()

        // Then

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.githubForAtCalled).to(beFalse())
        expect(self.interactorMock.numberOfGithubsAtCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCallsCount).to(equal(1))
        expect(categories).to(equal(2))
    }

    func test_whenNumberOfRows_thenInteractorNumberOfGithubs() {
        // Given

        interactorMock.numberOfGithubsAtReturnValue = 2

        // When

        let rows = presenter.numberOfRows(in: 3)

        // Then

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.githubForAtCalled).to(beFalse())
        expect(self.interactorMock.numberOfGithubsAtCallsCount).to(equal(1))
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfGithubsAtReceivedCategoryIndex).to(equal(3))
        expect(rows).to(equal(2))
    }

    func test_whenViewModelForRow_thenInteractorGithubForRow() {
        // Given

        interactorMock.githubForAtReturnValue = GithubItemProtocolMock(name: "Repository",
                                                                       author: "Author",
                                                                       license: "OpenBSD",
                                                                       contributorsCount: 2,
                                                                       starsCount: 3)

        // When

        let viewModel = presenter.viewModel(for: 1, at: 0)

        // Then

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.githubForAtCallsCount).to(equal(1))
        expect(self.interactorMock.numberOfGithubsAtCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.githubForAtReceivedArguments?.index).to(equal(1))
        expect(self.interactorMock.githubForAtReceivedArguments?.categoryIndex).to(equal(0))

        expect(viewModel.name).to(equal(NSAttributedString(string: "Repository",  attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black])))
        expect(viewModel.author).to(equal(NSAttributedString(string: "Author",  attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black])))
        expect(viewModel.contributors).to(equal(NSAttributedString(string: "\(2) contributors",  attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black])))
        expect(viewModel.starsCount).to(equal(NSAttributedString(string: "\(3) stars",  attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black])))

        expect(viewModel.license).to(equal(NSAttributedString(string: "OpenBSD",  attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black])))
    }

    func test_whenSetDefaultsValues_thenOutputSetTitle() {
        // When

        presenter.setDefaultsValues()

        // Then

        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfGithubsAtCalled).to(beFalse())
        expect(self.interactorMock.githubForAtCalled).to(beFalse())
        expect(self.interactorMock.retrieveCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCallsCount).to(equal(1))
        expect(self.outputMock.setTitleTitleReceivedTitle).to(equal("Github's top iOS"))
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateGithubsCalled).to(beFalse())
       }

    func test_whenUpdateGithubsList_thenOutputUpdateGithubs() {
        // When

        presenter.updateGithubsList()

        // Then

        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfGithubsAtCalled).to(beFalse())
        expect(self.interactorMock.githubForAtCalled).to(beFalse())
        expect(self.interactorMock.retrieveCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateGithubsCallsCount).to(equal(1))
    }

    func test_whenNotifyServerError_thenOutputShowError() {
        // When

        presenter.notifyServerError()

        // Then

        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfGithubsAtCalled).to(beFalse())
        expect(self.interactorMock.githubForAtCalled).to(beFalse())
        expect(self.interactorMock.retrieveCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateGithubsCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCallsCount).to(equal(1))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.message).to(equal("A server error occured"))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.retryMessage).to(equal("Retry ?"))
    }

    func test_whenNotifyNetworkError_thenOutputShowError() {
        // When

        presenter.notifyNetworkError()

        // Then

        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfGithubsAtCalled).to(beFalse())
        expect(self.interactorMock.githubForAtCalled).to(beFalse())
        expect(self.interactorMock.retrieveCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateGithubsCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCallsCount).to(equal(1))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.message).to(equal("A network error occured"))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.retryMessage).to(equal("Retry ?"))
    }

    func test_whenNotifyUnknownError_thenOutputShowError() {
        // When

        presenter.notifyUnknownError()

        // Then

        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfGithubsAtCalled).to(beFalse())
        expect(self.interactorMock.githubForAtCalled).to(beFalse())
        expect(self.interactorMock.retrieveCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateGithubsCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCallsCount).to(equal(1))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.message).to(equal("A unknown error occured"))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.retryMessage).to(equal("Retry ?"))
    }
}
