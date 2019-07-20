//
//  GithubDetailPresenter.swift
//  PopGithubRepos
//
//  Created by Thibaut Coutard on 20/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import PopGithubReposBusinessLogic

class GithubDetailPresenter {
    var output: GithubDetailPresenterOutput?
    private var interactor: GithubDetailInteractorInput
    private var router: GithubDetailRouterProtocol

    init(interactor: GithubDetailInteractorInput,
         router: GithubDetailRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension GithubDetailPresenter: GithubDetailPresenterInput {
    func viewDidLoad() {
        interactor.retrieve()
    }

    func didTapBack() {
        interactor.routeBack()
    }
}

extension GithubDetailPresenter: GithubDetailInteractorOutput {
    func setDefaultsValues() {
        output?.setTitle(title: "Github")
    }

    func updateGithub(github item: GithubDetailItemProtocol) {
        output?.hideLoading()

        output?.updateGithub(github: GithubDetailViewModel(name: NSAttributedString(string: item.name, attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]),
                                                           author: NSAttributedString(string: item.author, attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]),
                                                           license: NSAttributedString(string: item.license, attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]),
                                                           contributors: NSAttributedString(string: "\(item.contributorsCount) contributors", attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]),
                                                           starsCount: NSAttributedString(string: "\(item.starsCount) stars", attributes: [.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black])))
    }

    func notifyLoading() {
        output?.showLoading()
    }

    func notifyNoDataError() {
        output?.hideLoading()
        output?.showError(message: "Oups, nous n'avons pu retrouver votre repository !", backButton: "retour")
    }

    func routeBack() {
        router.routeBack()
    }

}

private struct GithubDetailViewModel: GithubDetailViewModelProtocol {
    var name: NSAttributedString
    var author: NSAttributedString
    var license: NSAttributedString
    var contributors: NSAttributedString
    var starsCount: NSAttributedString
}
