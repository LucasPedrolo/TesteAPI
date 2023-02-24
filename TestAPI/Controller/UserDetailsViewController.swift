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
    var repos: [UserRepos] = []
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        API.shared.getRepos(url: self.homeData?.reposUrl ?? "") { repositories in
            DispatchQueue.main.async {
                self.repos = repositories
                self.userDetailsView.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelData()
        userDetailsView.tableView.delegate = self
        userDetailsView.tableView.dataSource = self
        view.backgroundColor = UIColor(red: 10, green: 25, blue: 36)
        navigationController?.navigationBar.backgroundColor = UIColor(red: 10, green: 25, blue: 36)
        navigationController?.navigationBar.tintColor = UIColor(red: 255, green: 255, blue: 255)
    }
    
    func labelData() {
        userDetailsView.image.load(urlString: String(homeData?.avatarUrl ?? ""))
        userDetailsView.nameLabel.text = "\(String(homeData?.name ?? ""))"
        userDetailsView.followingButton.setTitle("\(String(homeData?.following ?? 0)) Following", for: .normal)
        userDetailsView.followersButton.setTitle("\(String(homeData?.followers ?? 0)) Followers", for: .normal)
        userDetailsView.loginLabel.text = "\(String(homeData?.login ?? ""))"
    }
}

extension UserDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: userDetailsView.cellID, for: indexPath) as! UserDetailsViewCell
        cell.repos = repos[indexPath.item]
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let gradeDetailViewController = GradeDetailsViewController(registerGrade: grades[indexPath.row])
//        self.navigationController?.pushViewController(gradeDetailViewController, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
}
