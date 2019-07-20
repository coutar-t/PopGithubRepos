//
//  GihtubDetailInteractorInput.swift
//  PopGithubReposBusinessLogic
//
//  Created by Thibaut Coutard on 20/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockableBusinessLogic
public protocol GithubDetailInteractorInput: class {
    var output: GithubDetailInteractorOutput? { get set }
    func retrieve()
    func routeBack()
}
