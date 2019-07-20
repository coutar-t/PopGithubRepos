//
//  GithubDetailModuleFactory.swift
//  PopGithubRepos
//
//  Created by Thibaut Coutard on 20/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import PopGithubReposBusinessLogic

class GithubDetailModuleFactory {
    func makeView() -> GithubDetailViewController {
        let view = StoryboardScene.GithubDetailStoryboard.gIthubDetailViewController.instantiate()

        let router = GithubDetailRouter()
        let interactor = GithubDetailInteractorModuleFactory().interactor()
        let presenter = GithubDetailPresenter(interactor: interactor,
                                              router: router)
        presenter.output = view
        interactor.output = presenter
        view.presenter = presenter
        router.viewController = view

        return view
    }
}
