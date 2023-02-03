//
//  UserDetailsViewController.swift
//  TestAPI
//
//  Created by unicred on 03/02/23.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    var userDetailsView: UserDetailsView = UserDetailsView()
    var homeData: UserData?
    
    init(user: UserData) {
        super.init(nibName: "UserDetailsViewController", bundle: nil)
        self.homeData = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = userDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelData()
    }
    
    func labelData() {
        
        userDetailsView.image.load(urlString: String(homeData?.avatarUrl ?? ""))
        userDetailsView.nameLabel.text = "Name: \(String(homeData?.name ?? ""))"
        userDetailsView.reposLabel.text = "Repositores: \(String(homeData?.publicRepos ?? 0))"
    }
}
