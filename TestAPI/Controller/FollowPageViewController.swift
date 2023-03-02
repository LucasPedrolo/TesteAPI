//
//  FollowPageViewController.swift
//  TestAPI
//
//  Created by unicred on 27/02/23.
//

import UIKit

class FollowPageViewController: UIViewController {
    var customView: FollowPageView = FollowPageView()
    
    override func loadView() {
        view = customView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(userData: UserData) {
        customView.userData = userData
        super.init(nibName: "FollowPageViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
