// Generated using Sourcery 0.16.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
import PopGithubReposBusinessLogic
import PopGithubRepos
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif














class GithubDetailPresenterInputMock: GithubDetailPresenterInput {
    var output: GithubDetailPresenterOutput?

    //MARK: - viewDidLoad

    var viewDidLoadCallsCount = 0
    var viewDidLoadCalled: Bool {
        return viewDidLoadCallsCount > 0
    }
    var viewDidLoadClosure: (() -> Void)?

    func viewDidLoad() {
        viewDidLoadCallsCount += 1
        viewDidLoadClosure?()
    }

    //MARK: - didTapBack

    var didTapBackCallsCount = 0
    var didTapBackCalled: Bool {
        return didTapBackCallsCount > 0
    }
    var didTapBackClosure: (() -> Void)?

    func didTapBack() {
        didTapBackCallsCount += 1
        didTapBackClosure?()
    }

}
class GithubDetailPresenterOutputMock: GithubDetailPresenterOutput {

    //MARK: - setTitle

    var setTitleTitleCallsCount = 0
    var setTitleTitleCalled: Bool {
        return setTitleTitleCallsCount > 0
    }
    var setTitleTitleReceivedTitle: String?
    var setTitleTitleReceivedInvocations: [String] = []
    var setTitleTitleClosure: ((String) -> Void)?

    func setTitle(title: String) {
        setTitleTitleCallsCount += 1
        setTitleTitleReceivedTitle = title
        setTitleTitleReceivedInvocations.append(title)
        setTitleTitleClosure?(title)
    }

    //MARK: - showError

    var showErrorMessageBackButtonCallsCount = 0
    var showErrorMessageBackButtonCalled: Bool {
        return showErrorMessageBackButtonCallsCount > 0
    }
    var showErrorMessageBackButtonReceivedArguments: (message: String, backButton: String)?
    var showErrorMessageBackButtonReceivedInvocations: [(message: String, backButton: String)] = []
    var showErrorMessageBackButtonClosure: ((String, String) -> Void)?

    func showError(message: String, backButton: String) {
        showErrorMessageBackButtonCallsCount += 1
        showErrorMessageBackButtonReceivedArguments = (message: message, backButton: backButton)
        showErrorMessageBackButtonReceivedInvocations.append((message: message, backButton: backButton))
        showErrorMessageBackButtonClosure?(message, backButton)
    }

    //MARK: - showLoading

    var showLoadingCallsCount = 0
    var showLoadingCalled: Bool {
        return showLoadingCallsCount > 0
    }
    var showLoadingClosure: (() -> Void)?

    func showLoading() {
        showLoadingCallsCount += 1
        showLoadingClosure?()
    }

    //MARK: - hideLoading

    var hideLoadingCallsCount = 0
    var hideLoadingCalled: Bool {
        return hideLoadingCallsCount > 0
    }
    var hideLoadingClosure: (() -> Void)?

    func hideLoading() {
        hideLoadingCallsCount += 1
        hideLoadingClosure?()
    }

    //MARK: - updateGithub

    var updateGithubGithubCallsCount = 0
    var updateGithubGithubCalled: Bool {
        return updateGithubGithubCallsCount > 0
    }
    var updateGithubGithubReceivedGithub: GithubDetailViewModelProtocol?
    var updateGithubGithubReceivedInvocations: [GithubDetailViewModelProtocol] = []
    var updateGithubGithubClosure: ((GithubDetailViewModelProtocol) -> Void)?

    func updateGithub(github: GithubDetailViewModelProtocol) {
        updateGithubGithubCallsCount += 1
        updateGithubGithubReceivedGithub = github
        updateGithubGithubReceivedInvocations.append(github)
        updateGithubGithubClosure?(github)
    }

}
class GithubDetailRouterProtocolMock: GithubDetailRouterProtocol {
    var viewController: UIViewController?

    //MARK: - routeBack

    var routeBackCallsCount = 0
    var routeBackCalled: Bool {
        return routeBackCallsCount > 0
    }
    var routeBackClosure: (() -> Void)?

    func routeBack() {
        routeBackCallsCount += 1
        routeBackClosure?()
    }

}
class GithubDetailViewModelProtocolMock: GithubDetailViewModelProtocol {
    var name: NSAttributedString {
        get { return underlyingName }
        set(value) { underlyingName = value }
    }
    var underlyingName: NSAttributedString!
    var author: NSAttributedString {
        get { return underlyingAuthor }
        set(value) { underlyingAuthor = value }
    }
    var underlyingAuthor: NSAttributedString!
    var license: NSAttributedString {
        get { return underlyingLicense }
        set(value) { underlyingLicense = value }
    }
    var underlyingLicense: NSAttributedString!
    var contributors: NSAttributedString {
        get { return underlyingContributors }
        set(value) { underlyingContributors = value }
    }
    var underlyingContributors: NSAttributedString!
    var starsCount: NSAttributedString {
        get { return underlyingStarsCount }
        set(value) { underlyingStarsCount = value }
    }
    var underlyingStarsCount: NSAttributedString!

    init() {}

    init(name: NSAttributedString, author: NSAttributedString, license: NSAttributedString, contributors: NSAttributedString, starsCount: NSAttributedString) {
      self.name = name
      self.author = author
      self.license = license
      self.contributors = contributors
      self.starsCount = starsCount
    }
}
class GithubViewModelProtocolMock: GithubViewModelProtocol {
    var name: NSAttributedString {
        get { return underlyingName }
        set(value) { underlyingName = value }
    }
    var underlyingName: NSAttributedString!
    var author: NSAttributedString {
        get { return underlyingAuthor }
        set(value) { underlyingAuthor = value }
    }
    var underlyingAuthor: NSAttributedString!
    var license: NSAttributedString {
        get { return underlyingLicense }
        set(value) { underlyingLicense = value }
    }
    var underlyingLicense: NSAttributedString!
    var contributors: NSAttributedString {
        get { return underlyingContributors }
        set(value) { underlyingContributors = value }
    }
    var underlyingContributors: NSAttributedString!
    var starsCount: NSAttributedString {
        get { return underlyingStarsCount }
        set(value) { underlyingStarsCount = value }
    }
    var underlyingStarsCount: NSAttributedString!

    init() {}

    init(name: NSAttributedString, author: NSAttributedString, license: NSAttributedString, contributors: NSAttributedString, starsCount: NSAttributedString) {
      self.name = name
      self.author = author
      self.license = license
      self.contributors = contributors
      self.starsCount = starsCount
    }
}
class GithubsListPresenterInputMock: GithubsListPresenterInput {
    var output: GithubsListPresenterOutput?

    //MARK: - viewDidLoad

    var viewDidLoadCallsCount = 0
    var viewDidLoadCalled: Bool {
        return viewDidLoadCallsCount > 0
    }
    var viewDidLoadClosure: (() -> Void)?

    func viewDidLoad() {
        viewDidLoadCallsCount += 1
        viewDidLoadClosure?()
    }

    //MARK: - numberOfSections

    var numberOfSectionsCallsCount = 0
    var numberOfSectionsCalled: Bool {
        return numberOfSectionsCallsCount > 0
    }
    var numberOfSectionsReturnValue: Int!
    var numberOfSectionsClosure: (() -> Int)?

    func numberOfSections() -> Int {
        numberOfSectionsCallsCount += 1
        return numberOfSectionsClosure.map({ $0() }) ?? numberOfSectionsReturnValue
    }

    //MARK: - numberOfRows

    var numberOfRowsInCallsCount = 0
    var numberOfRowsInCalled: Bool {
        return numberOfRowsInCallsCount > 0
    }
    var numberOfRowsInReceivedSection: Int?
    var numberOfRowsInReceivedInvocations: [Int] = []
    var numberOfRowsInReturnValue: Int!
    var numberOfRowsInClosure: ((Int) -> Int)?

    func numberOfRows(in section: Int) -> Int {
        numberOfRowsInCallsCount += 1
        numberOfRowsInReceivedSection = section
        numberOfRowsInReceivedInvocations.append(section)
        return numberOfRowsInClosure.map({ $0(section) }) ?? numberOfRowsInReturnValue
    }

    //MARK: - viewModel

    var viewModelForAtCallsCount = 0
    var viewModelForAtCalled: Bool {
        return viewModelForAtCallsCount > 0
    }
    var viewModelForAtReceivedArguments: (row: Int, section: Int)?
    var viewModelForAtReceivedInvocations: [(row: Int, section: Int)] = []
    var viewModelForAtReturnValue: GithubViewModelProtocol!
    var viewModelForAtClosure: ((Int, Int) -> GithubViewModelProtocol)?

    func viewModel(for row: Int, at section: Int) -> GithubViewModelProtocol {
        viewModelForAtCallsCount += 1
        viewModelForAtReceivedArguments = (row: row, section: section)
        viewModelForAtReceivedInvocations.append((row: row, section: section))
        return viewModelForAtClosure.map({ $0(row, section) }) ?? viewModelForAtReturnValue
    }

    //MARK: - didTapRow

    var didTapRowForAtCallsCount = 0
    var didTapRowForAtCalled: Bool {
        return didTapRowForAtCallsCount > 0
    }
    var didTapRowForAtReceivedArguments: (row: Int, section: Int)?
    var didTapRowForAtReceivedInvocations: [(row: Int, section: Int)] = []
    var didTapRowForAtClosure: ((Int, Int) -> Void)?

    func didTapRow(for row: Int, at section: Int) {
        didTapRowForAtCallsCount += 1
        didTapRowForAtReceivedArguments = (row: row, section: section)
        didTapRowForAtReceivedInvocations.append((row: row, section: section))
        didTapRowForAtClosure?(row, section)
    }

}
class GithubsListPresenterOutputMock: GithubsListPresenterOutput {

    //MARK: - setTitle

    var setTitleTitleCallsCount = 0
    var setTitleTitleCalled: Bool {
        return setTitleTitleCallsCount > 0
    }
    var setTitleTitleReceivedTitle: String?
    var setTitleTitleReceivedInvocations: [String] = []
    var setTitleTitleClosure: ((String) -> Void)?

    func setTitle(title: String) {
        setTitleTitleCallsCount += 1
        setTitleTitleReceivedTitle = title
        setTitleTitleReceivedInvocations.append(title)
        setTitleTitleClosure?(title)
    }

    //MARK: - showLoading

    var showLoadingCallsCount = 0
    var showLoadingCalled: Bool {
        return showLoadingCallsCount > 0
    }
    var showLoadingClosure: (() -> Void)?

    func showLoading() {
        showLoadingCallsCount += 1
        showLoadingClosure?()
    }

    //MARK: - hideLoading

    var hideLoadingCallsCount = 0
    var hideLoadingCalled: Bool {
        return hideLoadingCallsCount > 0
    }
    var hideLoadingClosure: (() -> Void)?

    func hideLoading() {
        hideLoadingCallsCount += 1
        hideLoadingClosure?()
    }

    //MARK: - updateGithubs

    var updateGithubsCallsCount = 0
    var updateGithubsCalled: Bool {
        return updateGithubsCallsCount > 0
    }
    var updateGithubsClosure: (() -> Void)?

    func updateGithubs() {
        updateGithubsCallsCount += 1
        updateGithubsClosure?()
    }

    //MARK: - showError

    var showErrorWithRetryMessageCallsCount = 0
    var showErrorWithRetryMessageCalled: Bool {
        return showErrorWithRetryMessageCallsCount > 0
    }
    var showErrorWithRetryMessageReceivedArguments: (message: String, retryMessage: String)?
    var showErrorWithRetryMessageReceivedInvocations: [(message: String, retryMessage: String)] = []
    var showErrorWithRetryMessageClosure: ((String, String) -> Void)?

    func showError(with message: String, retryMessage: String) {
        showErrorWithRetryMessageCallsCount += 1
        showErrorWithRetryMessageReceivedArguments = (message: message, retryMessage: retryMessage)
        showErrorWithRetryMessageReceivedInvocations.append((message: message, retryMessage: retryMessage))
        showErrorWithRetryMessageClosure?(message, retryMessage)
    }

}
class GithubsListRouterProtocolMock: GithubsListRouterProtocol {
    var viewController: UIViewController?

    //MARK: - routeToDetails

    var routeToDetailsCallsCount = 0
    var routeToDetailsCalled: Bool {
        return routeToDetailsCallsCount > 0
    }
    var routeToDetailsClosure: (() -> Void)?

    func routeToDetails() {
        routeToDetailsCallsCount += 1
        routeToDetailsClosure?()
    }

}
