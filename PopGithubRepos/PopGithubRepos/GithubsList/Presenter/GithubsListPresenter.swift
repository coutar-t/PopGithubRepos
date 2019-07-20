//
//  GithubsListPresenter.swift
//  PopGithubRepos
//
//  Created by Thibaut Coutard on 19/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import PopGithubReposBusinessLogic

class GithubsListPresenter {
    weak var output: GithubsListPresenterOutput?
    private var interactor: GithubsListInteractorInput
    private var router: GithubsListRouterProtocol

    init(interactor: GithubsListInteractorInput,
         router: GithubsListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension GithubsListPresenter: GithubsListPresenterInput {
    func viewDidLoad() {
        interactor.retrieve()
    }

    func numberOfSections() -> Int {
        return interactor.numberOfCategories()
    }

    func numberOfRows(in section: Int) -> Int {
        return interactor.numberOfGithubs(at: section)
    }

    func viewModel(for row: Int, at section: Int) -> GithubViewModelProtocol {
        guard let item = interactor.github(for: row, at: section) else {
        return GithubViewModel(
            name: NSAttributedString(string: ""),
            author: NSAttributedString(string: ""),
            license: NSAttributedString(string: ""),
            contributors: NSAttributedString(string: ""),
            starsCount: NSAttributedString(string: ""))
        }
        return GithubViewModel(
            name: NSAttributedString(string: item.name, attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]),
            author: NSAttributedString(string: item.author,  attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]),
            license: NSAttributedString(string: item.license,  attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]),
            contributors: NSAttributedString(string: "\(item.contributorsCount) contributors",  attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]),
            starsCount: NSAttributedString(string: "\(item.starsCount) stars",  attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]))
    }

    func didTapRow(for row: Int, at section: Int) {
        interactor.didSelectGithub(for: row, at: section)
    }

}

extension GithubsListPresenter: GithubsListInteractorOutput {
    func setDefaultsValues() {
        output?.setTitle(title: "Github's top iOS")
    }

    func notifyLoading() {
        output?.showLoading()
    }

    func updateGithubsList() {
        output?.hideLoading()
        output?.updateGithubs()
    }

    func notifyServerError() {
        output?.hideLoading()
        output?.showError(with: "A server error occured", retryMessage: "Retry ?")
    }

    func notifyNetworkError() {
        output?.hideLoading()
        output?.showError(with: "A network error occured", retryMessage: "Retry ?")
    }

    func notifyUnknownError() {
        output?.hideLoading()
        output?.showError(with: "A unknown error occured", retryMessage: "Retry ?")
    }

    func routeToDetails() {
        router.routeToDetails()
    }
}

private struct GithubViewModel: GithubViewModelProtocol {
    var name: NSAttributedString
    var author: NSAttributedString
    var license: NSAttributedString
    var contributors: NSAttributedString
    var starsCount: NSAttributedString
}
