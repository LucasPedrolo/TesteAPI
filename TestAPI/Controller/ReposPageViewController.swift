//
//  ReposiPageViewController.swift
//  TestAPI
//
//  Created by unicred on 27/02/23.
//

import UIKit

class ReposPageViewController: UIViewController {
    var customView: ReposPageView = ReposPageView()
    
    override func loadView() {
        view = customView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(userRepos: UserRepos) {
        customView.repos = userRepos
        super.init(nibName: "ReposPageViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
