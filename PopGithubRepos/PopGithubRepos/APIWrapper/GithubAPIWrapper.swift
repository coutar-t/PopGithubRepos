//
//  GithubAPIWrapper.swift
//  PopGithubRepos
//
//  Created by Thibaut Coutard on 19/07/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

class GithubAPIWrapper {
    static var shared = GithubAPIWrapper()
    var currentTask: URLSessionDataTask?

    func getiOSRepositories(success: @escaping (GithubRepositoriesList) -> Void, error: (Error) -> Void) {
        DispatchQueue.global(qos: .background).async {

        guard let url = URL(string: "https://api.github.com/search/repositories?q=topic:ios") else { return }
            self.currentTask?.cancel()
            self.currentTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {

                do {
                        DispatchQueue.main.async {
                            try?
                            success(JSONDecoder().decode(GithubRepositoriesList.self, from: data))
                    }
                } catch let e {
                    print(e.localizedDescription)
                }
            }
        }
            self.currentTask?.resume()
        }
    }
}

struct GithubRepositoriesList: Codable {
    var total_count: Int?
    var items: [GithubRepository]?
}

struct GithubRepository: Codable {
    var name: String?
    var owner: GithubOwner?
    var license: GithubLicense?
    var stargazers_count: Int?
}

struct GithubLicense: Codable {
    var name: String?
}

struct GithubOwner: Codable {
    var login: String?
}
