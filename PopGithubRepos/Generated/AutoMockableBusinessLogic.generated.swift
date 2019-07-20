// Generated using Sourcery 0.16.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
import PopGithubReposBusinessLogic
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif














class CurrentGithubRepositoryOutputMock: CurrentGithubRepositoryOutput {

    //MARK: - didGet

    var didGetGithubCallsCount = 0
    var didGetGithubCalled: Bool {
        return didGetGithubCallsCount > 0
    }
    var didGetGithubReceivedGithub: CurrentGithubRepositoryResponseProtocol?
    var didGetGithubReceivedInvocations: [CurrentGithubRepositoryResponseProtocol] = []
    var didGetGithubClosure: ((CurrentGithubRepositoryResponseProtocol) -> Void)?

    func didGet(github: CurrentGithubRepositoryResponseProtocol) {
        didGetGithubCallsCount += 1
        didGetGithubReceivedGithub = github
        didGetGithubReceivedInvocations.append(github)
        didGetGithubClosure?(github)
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
class CurrentGithubRepositoryProtocolMock: CurrentGithubRepositoryProtocol {
    var output: CurrentGithubRepositoryOutput?

    //MARK: - get

    var getCallsCount = 0
    var getCalled: Bool {
        return getCallsCount > 0
    }
    var getClosure: (() -> Void)?

    func get() {
        getCallsCount += 1
        getClosure?()
    }

    //MARK: - save

    var saveCurrentGithubCallsCount = 0
    var saveCurrentGithubCalled: Bool {
        return saveCurrentGithubCallsCount > 0
    }
    var saveCurrentGithubReceivedCurrentGithub: CurrentGithubRepositoryRequestProtocol?
    var saveCurrentGithubReceivedInvocations: [CurrentGithubRepositoryRequestProtocol] = []
    var saveCurrentGithubClosure: ((CurrentGithubRepositoryRequestProtocol) -> Void)?

    func save(currentGithub: CurrentGithubRepositoryRequestProtocol) {
        saveCurrentGithubCallsCount += 1
        saveCurrentGithubReceivedCurrentGithub = currentGithub
        saveCurrentGithubReceivedInvocations.append(currentGithub)
        saveCurrentGithubClosure?(currentGithub)
    }

    //MARK: - clear

    var clearCallsCount = 0
    var clearCalled: Bool {
        return clearCallsCount > 0
    }
    var clearClosure: (() -> Void)?

    func clear() {
        clearCallsCount += 1
        clearClosure?()
    }

}
class CurrentGithubRepositoryRequestProtocolMock: CurrentGithubRepositoryRequestProtocol {
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
class CurrentGithubRepositoryResponseProtocolMock: CurrentGithubRepositoryResponseProtocol {
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
class GithubDetailInteractorInputMock: GithubDetailInteractorInput {
    var output: GithubDetailInteractorOutput?

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
class GithubDetailInteractorModuleFactoryProtocolMock: GithubDetailInteractorModuleFactoryProtocol {

    //MARK: - interactor

    var interactorCallsCount = 0
    var interactorCalled: Bool {
        return interactorCallsCount > 0
    }
    var interactorReturnValue: GithubDetailInteractorInput!
    var interactorClosure: (() -> GithubDetailInteractorInput)?

    func interactor() -> GithubDetailInteractorInput {
        interactorCallsCount += 1
        return interactorClosure.map({ $0() }) ?? interactorReturnValue
    }

}
class GithubDetailInteractorOutputMock: GithubDetailInteractorOutput {

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

    //MARK: - updateGithub

    var updateGithubGithubCallsCount = 0
    var updateGithubGithubCalled: Bool {
        return updateGithubGithubCallsCount > 0
    }
    var updateGithubGithubReceivedGithub: GithubDetailItemProtocol?
    var updateGithubGithubReceivedInvocations: [GithubDetailItemProtocol] = []
    var updateGithubGithubClosure: ((GithubDetailItemProtocol) -> Void)?

    func updateGithub(github: GithubDetailItemProtocol) {
        updateGithubGithubCallsCount += 1
        updateGithubGithubReceivedGithub = github
        updateGithubGithubReceivedInvocations.append(github)
        updateGithubGithubClosure?(github)
    }

    //MARK: - notifyLoading

    var notifyLoadingCallsCount = 0
    var notifyLoadingCalled: Bool {
        return notifyLoadingCallsCount > 0
    }
    var notifyLoadingClosure: (() -> Void)?

    func notifyLoading() {
        notifyLoadingCallsCount += 1
        notifyLoadingClosure?()
    }

    //MARK: - notifyNoDataError

    var notifyNoDataErrorCallsCount = 0
    var notifyNoDataErrorCalled: Bool {
        return notifyNoDataErrorCallsCount > 0
    }
    var notifyNoDataErrorClosure: (() -> Void)?

    func notifyNoDataError() {
        notifyNoDataErrorCallsCount += 1
        notifyNoDataErrorClosure?()
    }

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
class GithubDetailItemProtocolMock: GithubDetailItemProtocol {
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

    //MARK: - didSelectGithub

    var didSelectGithubForAtCallsCount = 0
    var didSelectGithubForAtCalled: Bool {
        return didSelectGithubForAtCallsCount > 0
    }
    var didSelectGithubForAtReceivedArguments: (index: Int, categoryIndex: Int)?
    var didSelectGithubForAtReceivedInvocations: [(index: Int, categoryIndex: Int)] = []
    var didSelectGithubForAtClosure: ((Int, Int) -> Void)?

    func didSelectGithub(for index: Int, at categoryIndex: Int) {
        didSelectGithubForAtCallsCount += 1
        didSelectGithubForAtReceivedArguments = (index: index, categoryIndex: categoryIndex)
        didSelectGithubForAtReceivedInvocations.append((index: index, categoryIndex: categoryIndex))
        didSelectGithubForAtClosure?(index, categoryIndex)
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

    //MARK: - notifyLoading

    var notifyLoadingCallsCount = 0
    var notifyLoadingCalled: Bool {
        return notifyLoadingCallsCount > 0
    }
    var notifyLoadingClosure: (() -> Void)?

    func notifyLoading() {
        notifyLoadingCallsCount += 1
        notifyLoadingClosure?()
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
