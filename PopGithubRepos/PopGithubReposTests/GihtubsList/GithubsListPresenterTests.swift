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
    var routerMock: GithubsListRouterProtocolMock!

    override func setUp() {
        interactorMock = GithubsListInteractorInputMock()
        outputMock = GithubsListPresenterOutputMock()
        routerMock = GithubsListRouterProtocolMock()
        presenter = GithubsListPresenter(interactor: interactorMock,
                                         router: routerMock)
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

    func test_whenViewModelForWrongRow_thenInteractorGithubForRow() {
        // Given

        interactorMock.githubForAtReturnValue = nil

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

        expect(viewModel.name).to(equal(NSAttributedString(string: "")))
        expect(viewModel.author).to(equal(NSAttributedString(string: "")))
        expect(viewModel.contributors).to(equal(NSAttributedString(string: "")))
        expect(viewModel.starsCount).to(equal(NSAttributedString(string: "")))

        expect(viewModel.license).to(equal(NSAttributedString(string: "")))
    }

    func test_whenSetDefaultsValues_thenOutputSetTitle() {
        // When

        presenter.setDefaultsValues()

        // Then

        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfGithubsAtCalled).to(beFalse())
        expect(self.interactorMock.githubForAtCalled).to(beFalse())
        expect(self.interactorMock.retrieveCalled).to(beFalse())

        expect(self.outputMock.setSearchPlaceholderPlaceholderCallsCount).to(equal(1))
        expect(self.outputMock.setSearchPlaceholderPlaceholderReceivedPlaceholder).to(equal("Search"))
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
        expect(self.outputMock.hideLoadingCallsCount).to(equal(1))
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
        expect(self.outputMock.hideLoadingCallsCount).to(equal(1))
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
        expect(self.outputMock.hideLoadingCallsCount).to(equal(1))
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
        expect(self.outputMock.hideLoadingCallsCount).to(equal(1))
        expect(self.outputMock.updateGithubsCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCallsCount).to(equal(1))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.message).to(equal("A unknown error occured"))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.retryMessage).to(equal("Retry ?"))
    }

    func test_whenRouteToDetails_thenRouterRouteToDetails() {
        // When

        presenter.routeToDetails()

        // Then

        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfGithubsAtCalled).to(beFalse())
        expect(self.interactorMock.githubForAtCalled).to(beFalse())
        expect(self.interactorMock.retrieveCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateGithubsCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())

        expect(self.routerMock.routeToDetailsCallsCount).to(equal(1))
    }

    func test_whenDidTapRowAt_thenInteractorDidSelectGithub() {
        // When

        presenter.didTapRow(for: 2, at: 3)

        // Then

        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfGithubsAtCalled).to(beFalse())
        expect(self.interactorMock.githubForAtCalled).to(beFalse())
        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.didSelectGithubForAtCallsCount).to(equal(1))
        expect(self.interactorMock.didSelectGithubForAtReceivedArguments?.index).to(equal(2))
        expect(self.interactorMock.didSelectGithubForAtReceivedArguments?.categoryIndex).to(equal(3))

        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateGithubsCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())

        expect(self.routerMock.routeToDetailsCalled).to(beFalse())
    }

    func test_whenDidRefreshAndroid_thenUpdateNameAndRetrieveAndroid() {
        // When

        presenter.didRefreshAndroid()

        // Then

        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfGithubsAtCalled).to(beFalse())
        expect(self.interactorMock.githubForAtCalled).to(beFalse())
        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.didSelectGithubForAtCalled).to(beFalse())
        expect(self.interactorMock.retrieveAndroidCallsCount).to(equal(1))
        expect(self.interactorMock.retrieveiOSCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCallsCount).to(equal(1))
        expect(self.outputMock.setTitleTitleReceivedTitle).to(equal("Github's top Android"))
        expect(self.outputMock.setSwitchTextTextCallsCount).to(equal(1))
        expect(self.outputMock.setSwitchTextTextReceivedText).to(equal(NSAttributedString(string: "fetch Android", attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black])))

        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateGithubsCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())

        expect(self.routerMock.routeToDetailsCalled).to(beFalse())
    }

    func test_whenDidRefreshiOS_thenUpdateNameAndRetrieveiOS() {
        // When

        presenter.didRefreshiOS()

        // Then

        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfGithubsAtCalled).to(beFalse())
        expect(self.interactorMock.githubForAtCalled).to(beFalse())
        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.didSelectGithubForAtCalled).to(beFalse())
        expect(self.interactorMock.retrieveiOSCallsCount).to(equal(1))
        expect(self.interactorMock.retrieveAndroidCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCallsCount).to(equal(1))
        expect(self.outputMock.setTitleTitleReceivedTitle).to(equal("Github's top iOS"))
        expect(self.outputMock.setSwitchTextTextCallsCount).to(equal(1))
        expect(self.outputMock.setSwitchTextTextReceivedText).to(equal(NSAttributedString(string: "fetch iOS", attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black])))

        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateGithubsCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())

        expect(self.routerMock.routeToDetailsCalled).to(beFalse())
    }

    func test_whenDidTypeSearch_theInteractorSearch() {
        // When

        presenter.didTypeSearch(with: "Toto")

        // then

        expect(self.routerMock.routeToDetailsCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.updateGithubsCalled).to(beFalse())
        expect(self.outputMock.setSwitchTextTextCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
        expect(self.outputMock.setSearchPlaceholderPlaceholderCalled).to(beFalse())

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.searchForCallsCount).to(equal(1))
        expect(self.interactorMock.searchForReceivedText).to(equal("Toto"))
        expect(self.interactorMock.githubForAtCalled).to(beFalse())
        expect(self.interactorMock.retrieveiOSCalled).to(beFalse())
        expect(self.interactorMock.retrieveAndroidCalled).to(beFalse())
        expect(self.interactorMock.numberOfGithubsAtCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.didSelectGithubForAtCalled).to(beFalse())
    }
}
