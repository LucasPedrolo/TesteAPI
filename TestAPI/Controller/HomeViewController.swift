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
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView.searchButton.addTarget(self, action: #selector(getData), for: .touchUpInside)
    }
    
   @objc func getData() {
       let search = homeView.searchTxtField.text
       
       API.shared.getData(searchText: search ?? "") { userData in
           print(userData)
           
           DispatchQueue.main.async {
               let userDetails = UserDetailsViewController(user: userData)
               self.navigationController?.pushViewController(userDetails, animated: true)
           }
       }
    } 
}
