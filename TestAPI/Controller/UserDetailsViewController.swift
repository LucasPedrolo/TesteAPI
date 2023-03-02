//
//  UserDetailsViewController.swift
//  TestAPI
//
//  Created by unicred on 03/02/23.
//

import UIKit

class UserDetailsViewController: UIViewController {
    var customView: UserDetailsView = UserDetailsView()
    var homeData: UserData?
    var repos: [UserRepos] = []
    
    init(user: UserData) {
        super.init(nibName: "UserDetailsViewController", bundle: nil)
        self.homeData = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        API.shared.getRepos(url: self.homeData?.reposUrl ?? "") { repositories in
            DispatchQueue.main.async {
                self.repos = repositories
                self.customView.tableView.reloadData()
            }
        }
        navigationController?.navigationBar.backgroundColor = UIColor(red: 13, green: 20, blue: 24)
        navigationController?.navigationBar.tintColor = UIColor(red: 104, green: 154, blue: 243)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelData()
        addTarget()
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        view.backgroundColor = UIColor(red: 13, green: 20, blue: 24)
    }
    
    func labelData() {
        customView.image.load(urlString: String(homeData?.avatarUrl ?? ""))
        customView.nameLabel.text = "\(String(homeData?.name ?? ""))"
        customView.followingButton.setTitle("\(String(homeData?.following ?? 0)) following", for: .normal)
        customView.followersButton.setTitle("\(String(homeData?.followers ?? 0)) followers", for: .normal)
        customView.loginLabel.text = "\(String(homeData?.login ?? ""))"
    }
    
    func addTarget() {
        customView.followersButton.addTarget(self, action: #selector(goFollowers), for: .touchUpInside)
        customView.followingButton.addTarget(self, action: #selector(goFollowing), for: .touchUpInside)
        customView.followButton.addTarget(self, action: #selector(goFollow), for: .touchUpInside)
    }
    
    @objc func goFollowers() {
        if let home = homeData {
            let followersPageViewController = FollowersPageViewController(userData: home)
            self.navigationController?.pushViewController(followersPageViewController, animated: true)
        }
    }
    
    @objc func goFollowing() {
        if let home = homeData{
            let followingPageViewController = FollowingPageViewController(userData: home)
            self.navigationController?.pushViewController(followingPageViewController, animated: true)
        }
    }
    
    @objc func goFollow() {
        if let home = homeData{
            let followPageViewController = FollowPageViewController(userData: home)
            self.navigationController?.pushViewController(followPageViewController, animated: true)
        }
    }

}

extension UserDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customView.cellID, for: indexPath) as! UserDetailsViewCell
        cell.repos = repos[indexPath.item]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let reposPageViewController = ReposPageViewController(userRepos: repos[indexPath.row])
        self.navigationController?.pushViewController(reposPageViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
}
