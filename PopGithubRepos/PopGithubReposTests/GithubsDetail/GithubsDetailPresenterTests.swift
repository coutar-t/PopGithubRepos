//
//  GithubsListPresenterTests.swift
//  PopGithubReposTests
//
//  Created by Thibaut Coutard on 20/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
import Nimble
@testable import PopGithubRepos

class GithubsDetailPresenterTests: XCTestCase {
    var presenter: GithubDetailPresenter!
    var interactorMock: GithubDetailInteractorInputMock!
    var outputMock: GithubDetailPresenterOutputMock!
    var routerMock: GithubDetailRouterProtocolMock!

    override func setUp() {
        interactorMock = GithubDetailInteractorInputMock()
        outputMock = GithubDetailPresenterOutputMock()
        routerMock = GithubDetailRouterProtocolMock()
        presenter = GithubDetailPresenter(interactor: interactorMock, router: routerMock)
        presenter.output = outputMock
    }

    func test_whenViewDidLoad_thenInteractorRetrieve() {
        // When

        presenter.viewDidLoad()

        // Then

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.updateGithubGithubCalled).to(beFalse())
        expect(self.outputMock.showErrorMessageBackButtonCalled).to(beFalse())

        expect(self.interactorMock.retrieveCallsCount).to(equal(1))
        expect(self.interactorMock.routeBackCalled).to(beFalse())
    }

    func test_whenDidTapBack_thenInteractorRouteBack() {
        // When

        presenter.didTapBack()

        // Then

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.updateGithubGithubCalled).to(beFalse())
        expect(self.outputMock.showErrorMessageBackButtonCalled).to(beFalse())

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.routeBackCallsCount).to(equal(1))
    }

    func test_whenSetDefaultsValues_thenOutputSetTitle() {
        // When

        presenter.setDefaultsValues()

        // Then

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCallsCount).to(equal(1))
        expect(self.outputMock.setTitleTitleReceivedTitle).to(equal("Github"))
        expect(self.outputMock.updateGithubGithubCalled).to(beFalse())
        expect(self.outputMock.showErrorMessageBackButtonCalled).to(beFalse())

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.routeBackCalled).to(beFalse())
    }

    func test_whenNotifyLoading_thenOutputShowLoading() {
        // When

        presenter.notifyLoading()

        // Then

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.showLoadingCallsCount).to(equal(1))
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.updateGithubGithubCalled).to(beFalse())
        expect(self.outputMock.showErrorMessageBackButtonCalled).to(beFalse())

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.routeBackCalled).to(beFalse())
    }

    func test_whenNotifyNoDataError_thenOutputShowError() {
        // When

        presenter.notifyNoDataError()

        // Then

        expect(self.outputMock.hideLoadingCallsCount).to(equal(1))
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.updateGithubGithubCalled).to(beFalse())
        expect(self.outputMock.showErrorMessageBackButtonCallsCount).to(equal(1))
        expect(self.outputMock.showErrorMessageBackButtonReceivedArguments?.message).to(equal("Oups, nous n'avons pu retrouver votre repository !"))
        expect(self.outputMock.showErrorMessageBackButtonReceivedArguments?.backButton).to(equal("retour"))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.routeBackCalled).to(beFalse())
    }

    func test_whenRouteBack_thenRouterRouteBack() {
        // When

        presenter.routeBack()

        // Then

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.updateGithubGithubCalled).to(beFalse())
        expect(self.outputMock.showErrorMessageBackButtonCalled).to(beFalse())

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.routeBackCalled).to(beFalse())
        
    }

    func test_whenUpdateGithub_thenOutputUpdateGithub() {
        // When

        presenter.updateGithub(github: GithubDetailItemProtocolMock(name: "Name",
                                                                    author: "Author",
                                                                    license: "License",
                                                                    contributorsCount: 0,
                                                                    starsCount: 2))

        // Then

        expect(self.outputMock.hideLoadingCallsCount).to(equal(1))
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.updateGithubGithubCallsCount).to(equal(1))
        expect(self.outputMock.updateGithubGithubReceivedGithub?.author).to(equal(NSAttributedString(string: "Author", attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black])))
        expect(self.outputMock.updateGithubGithubReceivedGithub?.name).to(equal(NSAttributedString(string: "Name", attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black])))
        expect(self.outputMock.updateGithubGithubReceivedGithub?.license).to(equal(NSAttributedString(string: "License", attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black])))
        expect(self.outputMock.updateGithubGithubReceivedGithub?.contributors).to(equal(NSAttributedString(string: "0 contributors", attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black])))
        expect(self.outputMock.updateGithubGithubReceivedGithub?.starsCount).to(equal(NSAttributedString(string: "2 stars", attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black])))
        expect(self.outputMock.showErrorMessageBackButtonCalled).to(beFalse())

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.routeBackCalled).to(beFalse())

    }
}
