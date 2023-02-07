//
//  API.swift
//  TestAPI
//
//  Created by unicred on 03/02/23.
//

import Foundation

class API {
    
    static let shared: API = API()
    
    func getData(searchText: String, completion: @escaping (UserData) -> ()) {
        guard let baseUrl = URL(string: "https://api.github.com/users/\(searchText)") else { return }
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let response = response as! HTTPURLResponse
            if response.statusCode < 400 {
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let json = try? jsonDecoder.decode(UserData.self, from: data)
                    print(json as Any, ">>>>> funfa :>")
                    
                    if let json = json {
                        completion(json)
                    }
                }
            } else {
                print(error as Any, ">>>>>>>>>>> ERRO")
            }
        }
        task.resume()
    }
    
    func getRepos(url: String, completion: @escaping ([UserRepos]) -> ()) {
        guard let baseUrl = URL(string: "\(url)") else { return }
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let response = response as! HTTPURLResponse
            if response.statusCode < 400 {
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let json = try? jsonDecoder.decode(Array<UserRepos>.self, from: data)
                    print(json as Any, ">>>>> funfa :>")
                    
                    if let json = json {
                        completion(json)
                    }
                }
            } else {
                print(error as Any, ">>>>>>>>>>> ERRO")
            }
        }
        task.resume()
    }
}
