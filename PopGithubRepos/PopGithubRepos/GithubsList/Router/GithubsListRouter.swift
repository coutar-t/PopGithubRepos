//
//  GithubsListRouter.swift
//  PopGithubRepos
//
//  Created by Thibaut Coutard on 20/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import UIKit

class GithubsListRouter: GithubsListRouterProtocol {
    weak var viewController: UIViewController?

    init() {}

    func routeToDetails() {
        let detailViewController = GithubDetailModuleFactory().makeView()
        viewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
