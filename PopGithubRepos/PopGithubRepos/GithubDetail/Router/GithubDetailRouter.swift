//
//  GithubDetailRouter.swift
//  PopGithubRepos
//
//  Created by Thibaut Coutard on 20/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import UIKit

class GithubDetailRouter: GithubDetailRouterProtocol {
    var viewController: UIViewController?

    func routeBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}

