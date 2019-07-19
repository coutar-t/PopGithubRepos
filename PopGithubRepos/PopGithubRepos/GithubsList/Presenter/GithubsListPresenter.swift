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

    init(interactor: GithubsListInteractorInput) {
        self.interactor = interactor
    }
}

extension GithubsListPresenter: GithubsListPresenterInput {
    func viewDidLoad() {}

    func numberOfSections() -> Int { return 0 }

    func numberOfRows(in section: Int) -> Int { return 0 }

    func viewModel(for row: Int, at section: Int) -> GithubViewModelProtocol {
        return GithubViewModel(
            name: NSAttributedString(string: ""),
            author: NSAttributedString(string: ""),
            license: NSAttributedString(string: ""),
            contributors: NSAttributedString(string: ""),
            starsCount: NSAttributedString(string: ""))

    }

}

extension GithubsListPresenter: GithubsListInteractorOutput {
    func setDefaultsValues() {}

    func updateGithubsList() {}

    func notifyServerError() {}

    func notifyNetworkError() {}

    func notifyUnknownError() {}
}

private struct GithubViewModel: GithubViewModelProtocol {
    var name: NSAttributedString
    var author: NSAttributedString
    var license: NSAttributedString
    var contributors: NSAttributedString
    var starsCount: NSAttributedString
}
