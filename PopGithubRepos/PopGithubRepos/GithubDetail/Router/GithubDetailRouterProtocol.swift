//
//  GithubDetailRouterProtocol.swift
//  PopGithubRepos
//
//  Created by Thibaut Coutard on 20/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import UIKit

// sourcery: AutoMockable
public protocol GithubDetailRouterProtocol {
    var viewController: UIViewController? { get set }
    func routeBack()
}
