//
//  GithubsListModuleFactory.swift
//  PopGithubRepos
//
//  Created by Thibaut Coutard on 19/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import PopGithubReposBusinessLogic

class GithubsListModuleFactory {
    func makeView() -> UIViewController {
        let viewController = StoryboardScene.GithubsListStoryboard.githubsListViewController.instantiate()

        let interactor = GithubsListInteractorModuleFactory().interactor(getGithubsListRepository: GetGithubsListRepository())

        let router = GithubsListRouter()
        router.viewController = viewController

        let presenter = GithubsListPresenter(interactor: interactor,
                                             router: router)

        interactor.output = presenter
        presenter.output = viewController

        viewController.presenter = presenter
        

        return viewController
    }
}
