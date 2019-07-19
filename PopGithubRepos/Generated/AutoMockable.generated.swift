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














class GetGithubsListRepositoryOutputMock: GetGithubsListRepositoryOutput {

    //MARK: - didGet

    var didGetGithubsCallsCount = 0
    var didGetGithubsCalled: Bool {
        return didGetGithubsCallsCount > 0
    }
    var didGetGithubsReceivedGithubs: [GetGithubsListRepositoryResponseProtocol]?
    var didGetGithubsReceivedInvocations: [[GetGithubsListRepositoryResponseProtocol]] = []
    var didGetGithubsClosure: (([GetGithubsListRepositoryResponseProtocol]) -> Void)?

    func didGet(githubs: [GetGithubsListRepositoryResponseProtocol]) {
        didGetGithubsCallsCount += 1
        didGetGithubsReceivedGithubs = githubs
        didGetGithubsReceivedInvocations.append(githubs)
        didGetGithubsClosure?(githubs)
    }

    //MARK: - didHandleError

    var didHandleErrorCallsCount = 0
    var didHandleErrorCalled: Bool {
        return didHandleErrorCallsCount > 0
    }
    var didHandleErrorClosure: (() -> Void)?

    func didHandleError() {
        didHandleErrorCallsCount += 1
        didHandleErrorClosure?()
    }

}
class GetGithubsListRepositoryProtocolMock: GetGithubsListRepositoryProtocol {
    var output: GetGithubsListRepositoryOutput?

    //MARK: - getiOSRepositories

    var getiOSRepositoriesCallsCount = 0
    var getiOSRepositoriesCalled: Bool {
        return getiOSRepositoriesCallsCount > 0
    }
    var getiOSRepositoriesClosure: (() -> Void)?

    func getiOSRepositories() {
        getiOSRepositoriesCallsCount += 1
        getiOSRepositoriesClosure?()
    }

}
class GetGithubsListRepositoryResponseProtocolMock: GetGithubsListRepositoryResponseProtocol {
    var name: String {
        get { return underlyingName }
        set(value) { underlyingName = value }
    }
    var underlyingName: String!
    var author: String {
        get { return underlyingAuthor }
        set(value) { underlyingAuthor = value }
    }
    var underlyingAuthor: String!
    var license: String {
        get { return underlyingLicense }
        set(value) { underlyingLicense = value }
    }
    var underlyingLicense: String!
    var contributorsCount: Int {
        get { return underlyingContributorsCount }
        set(value) { underlyingContributorsCount = value }
    }
    var underlyingContributorsCount: Int!
    var starsCount: Int {
        get { return underlyingStarsCount }
        set(value) { underlyingStarsCount = value }
    }
    var underlyingStarsCount: Int!

    init() {}

    init(name: String, author: String, license: String, contributorsCount: Int, starsCount: Int) {
      self.name = name
      self.author = author
      self.license = license
      self.contributorsCount = contributorsCount
      self.starsCount = starsCount
    }
}
class GithubItemProtocolMock: GithubItemProtocol {
    var name: String {
        get { return underlyingName }
        set(value) { underlyingName = value }
    }
    var underlyingName: String!
    var author: String {
        get { return underlyingAuthor }
        set(value) { underlyingAuthor = value }
    }
    var underlyingAuthor: String!
    var license: String {
        get { return underlyingLicense }
        set(value) { underlyingLicense = value }
    }
    var underlyingLicense: String!
    var contributorsCount: Int {
        get { return underlyingContributorsCount }
        set(value) { underlyingContributorsCount = value }
    }
    var underlyingContributorsCount: Int!
    var starsCount: Int {
        get { return underlyingStarsCount }
        set(value) { underlyingStarsCount = value }
    }
    var underlyingStarsCount: Int!

    init() {}

    init(name: String, author: String, license: String, contributorsCount: Int, starsCount: Int) {
      self.name = name
      self.author = author
      self.license = license
      self.contributorsCount = contributorsCount
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
class GithubsListInteractorInputMock: GithubsListInteractorInput {
    var output: GithubsListInteractorOutput?

    //MARK: - retrieve

    var retrieveCallsCount = 0
    var retrieveCalled: Bool {
        return retrieveCallsCount > 0
    }
    var retrieveClosure: (() -> Void)?

    func retrieve() {
        retrieveCallsCount += 1
        retrieveClosure?()
    }

    //MARK: - numberOfCategories

    var numberOfCategoriesCallsCount = 0
    var numberOfCategoriesCalled: Bool {
        return numberOfCategoriesCallsCount > 0
    }
    var numberOfCategoriesReturnValue: Int!
    var numberOfCategoriesClosure: (() -> Int)?

    func numberOfCategories() -> Int {
        numberOfCategoriesCallsCount += 1
        return numberOfCategoriesClosure.map({ $0() }) ?? numberOfCategoriesReturnValue
    }

    //MARK: - numberOfGithubs

    var numberOfGithubsAtCallsCount = 0
    var numberOfGithubsAtCalled: Bool {
        return numberOfGithubsAtCallsCount > 0
    }
    var numberOfGithubsAtReceivedCategoryIndex: Int?
    var numberOfGithubsAtReceivedInvocations: [Int] = []
    var numberOfGithubsAtReturnValue: Int!
    var numberOfGithubsAtClosure: ((Int) -> Int)?

    func numberOfGithubs(at categoryIndex: Int) -> Int {
        numberOfGithubsAtCallsCount += 1
        numberOfGithubsAtReceivedCategoryIndex = categoryIndex
        numberOfGithubsAtReceivedInvocations.append(categoryIndex)
        return numberOfGithubsAtClosure.map({ $0(categoryIndex) }) ?? numberOfGithubsAtReturnValue
    }

    //MARK: - github

    var githubForAtCallsCount = 0
    var githubForAtCalled: Bool {
        return githubForAtCallsCount > 0
    }
    var githubForAtReceivedArguments: (index: Int, categoryIndex: Int)?
    var githubForAtReceivedInvocations: [(index: Int, categoryIndex: Int)] = []
    var githubForAtReturnValue: GithubItemProtocol?
    var githubForAtClosure: ((Int, Int) -> GithubItemProtocol?)?

    func github(for index: Int, at categoryIndex: Int) -> GithubItemProtocol? {
        githubForAtCallsCount += 1
        githubForAtReceivedArguments = (index: index, categoryIndex: categoryIndex)
        githubForAtReceivedInvocations.append((index: index, categoryIndex: categoryIndex))
        return githubForAtClosure.map({ $0(index, categoryIndex) }) ?? githubForAtReturnValue
    }

}
class GithubsListInteractorModuleFactoryProtocolMock: GithubsListInteractorModuleFactoryProtocol {

    //MARK: - interactor

    var interactorGetGithubsListRepositoryCallsCount = 0
    var interactorGetGithubsListRepositoryCalled: Bool {
        return interactorGetGithubsListRepositoryCallsCount > 0
    }
    var interactorGetGithubsListRepositoryReceivedGetGithubsListRepository: GetGithubsListRepositoryProtocol?
    var interactorGetGithubsListRepositoryReceivedInvocations: [GetGithubsListRepositoryProtocol] = []
    var interactorGetGithubsListRepositoryReturnValue: GithubsListInteractorInput!
    var interactorGetGithubsListRepositoryClosure: ((GetGithubsListRepositoryProtocol) -> GithubsListInteractorInput)?

    func interactor(getGithubsListRepository: GetGithubsListRepositoryProtocol) -> GithubsListInteractorInput {
        interactorGetGithubsListRepositoryCallsCount += 1
        interactorGetGithubsListRepositoryReceivedGetGithubsListRepository = getGithubsListRepository
        interactorGetGithubsListRepositoryReceivedInvocations.append(getGithubsListRepository)
        return interactorGetGithubsListRepositoryClosure.map({ $0(getGithubsListRepository) }) ?? interactorGetGithubsListRepositoryReturnValue
    }

}
class GithubsListInteractorOutputMock: GithubsListInteractorOutput {

    //MARK: - setDefaultsValues

    var setDefaultsValuesCallsCount = 0
    var setDefaultsValuesCalled: Bool {
        return setDefaultsValuesCallsCount > 0
    }
    var setDefaultsValuesClosure: (() -> Void)?

    func setDefaultsValues() {
        setDefaultsValuesCallsCount += 1
        setDefaultsValuesClosure?()
    }

    //MARK: - updateGithubsList

    var updateGithubsListCallsCount = 0
    var updateGithubsListCalled: Bool {
        return updateGithubsListCallsCount > 0
    }
    var updateGithubsListClosure: (() -> Void)?

    func updateGithubsList() {
        updateGithubsListCallsCount += 1
        updateGithubsListClosure?()
    }

    //MARK: - notifyServerError

    var notifyServerErrorCallsCount = 0
    var notifyServerErrorCalled: Bool {
        return notifyServerErrorCallsCount > 0
    }
    var notifyServerErrorClosure: (() -> Void)?

    func notifyServerError() {
        notifyServerErrorCallsCount += 1
        notifyServerErrorClosure?()
    }

    //MARK: - notifyNetworkError

    var notifyNetworkErrorCallsCount = 0
    var notifyNetworkErrorCalled: Bool {
        return notifyNetworkErrorCallsCount > 0
    }
    var notifyNetworkErrorClosure: (() -> Void)?

    func notifyNetworkError() {
        notifyNetworkErrorCallsCount += 1
        notifyNetworkErrorClosure?()
    }

    //MARK: - notifyUnknownError

    var notifyUnknownErrorCallsCount = 0
    var notifyUnknownErrorCalled: Bool {
        return notifyUnknownErrorCallsCount > 0
    }
    var notifyUnknownErrorClosure: (() -> Void)?

    func notifyUnknownError() {
        notifyUnknownErrorCallsCount += 1
        notifyUnknownErrorClosure?()
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
