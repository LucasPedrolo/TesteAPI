//
//  FollowPageView.swift
//  TestAPI
//
//  Created by unicred on 27/02/23.
//

import UIKit
import WebKit

class FollowPageView: BaseView {
    var userData: UserData? {
        didSet {
            dataView.load(URLRequest(url: URL(string: "https://github.com/login?return_to=https%3A%2F%2Fgithub.com%2F\(userData?.login ?? "")")!))
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
