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
        
        view.backgroundColor = UIColor(red: 10, green: 25, blue: 36)
        navigationController?.navigationBar.backgroundColor = UIColor(red: 10, green: 25, blue: 36)
        navigationController?.navigationBar.tintColor = UIColor(red: 255, green: 255, blue: 255)
    }
    
    func labelData() {
        
        userDetailsView.image.load(urlString: String(homeData?.avatarUrl ?? ""))
        userDetailsView.nameLabel.text = "\(String(homeData?.name ?? ""))"
        userDetailsView.reposLabel.text = "Repositores: \(String(homeData?.publicRepos ?? 0))"
        userDetailsView.followingButton.setTitle("\(String(homeData?.following ?? 0)) Following", for: .normal)
        userDetailsView.followersButton.setTitle("\(String(homeData?.followers ?? 0)) Followers", for: .normal)
        userDetailsView.loginLabel.text = "\(String(homeData?.login ?? ""))"
    }
}
