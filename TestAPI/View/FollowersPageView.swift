//
//  FollowersPageView.swift
//  TestAPI
//
//  Created by unicred on 27/02/23.
//

import UIKit
import WebKit

class FollowersPageView: BaseView {
    var userData: UserData? {
        didSet {
            dataView.load(URLRequest(url: URL(string: "https://github.com/\(userData?.login ?? "")?tab=followers")!))
        }
    }
    
    lazy var dataView: WKWebView = {
        let view = WKWebView()
        return view
    }()
    
    override func addSubviews() {
        addSubview(dataView)
    }
    
    override func setConstraints() {
        dataView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: frame.width, height: frame.height))
    }
}
