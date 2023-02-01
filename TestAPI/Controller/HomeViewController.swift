//
//  HomeViewController.swift
//  TestAPI
//
//  Created by unicred on 01/02/23.
//

import UIKit

class HomeViewController: UIViewController {
    var homeView: HomeView = HomeView()
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView.searchButton.addTarget(self, action: #selector(getData), for: .touchUpInside)
    }
    
   @objc func getData() {
        let semaphore = DispatchSemaphore (value: 0)

        let parameters = "{\n\"username\": \"user\", \"password\": \"123\" \n} \n"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://api.github.com/users/LucasPedrolo")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ1c2VyIiwiZXhwIjoxNjcwNTA4OTQwLCJyb2wiOlsiUk9MRV9VU0VSIl19.Q36xhw6x0VNj_gh-NJ7IAbfAjyQw1rUXr5xYTwDVX3WV0m4pYyYf_PBcm4txKqP50jjZ9KCHBS1na3ILulirMw", forHTTPHeaderField: "Authorization")
        request.addValue("text/plain", forHTTPHeaderField: "Content-Type")
        request.addValue("_octo=GH1.1.1616626714.1675262111; logged_in=no", forHTTPHeaderField: "Cookie")

        request.httpMethod = "GET"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
}
