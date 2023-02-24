//
//  UserDetailsViewControllerCell.swift
//  TestAPI
//
//  Created by unicred on 07/02/23.
//

import UIKit

class UserDetailsViewCell: BaseTableCell {
    var repos: UserRepos? {
        didSet {
            subjectLabel.text = "\(repos?.name ?? "")"
            nameLabel.text = "\(repos?.language ?? "")"
        }
    }
    
    lazy var container: UIView = {
        let test = UIView()
        test.layer.masksToBounds = true
        test.layer.cornerRadius = 2
        test.layer.borderWidth = 1
        test.layer.borderColor = UIColor(red: 86, green: 86, blue: 86).cgColor
        test.backgroundColor = UIColor(red: 10, green: 25, blue: 36)
        return test
    }()
    
    lazy var subjectLabel: UILabel = {
        let subject = UILabel()
        subject.text = ""
        subject.textColor = .systemBlue
        subject.font = UIFont.systemFont(ofSize: 15)
        subject.layer.cornerRadius = 2
        return subject
    }()
    
    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.text = ""
        name.textColor = UIColor.systemGray2
        name.font = UIFont.systemFont(ofSize: 12)
        name.layer.cornerRadius = 2
        return name
    }()
    
    lazy var viewRounded: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.backgroundColor = .orange
        view.layer.cornerRadius = 7.5
        return view
    }()
    
    lazy var publicLabel: UILabel = {
        let label = UILabel()
        label.text = "Public"
        label.textColor = UIColor.systemGray2
        label.font = UIFont.systemFont(ofSize: 12)
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 0.5
        label.layer.borderColor = UIColor.systemGray2.cgColor
        label.textAlignment = .center
        return label
    }()
    
    override func addSubview() {
        addSubview(container)
        container.addSubview(subjectLabel)
        container.addSubview(nameLabel)
        container.addSubview(viewRounded)
        container.addSubview(publicLabel)
    }
    
    override func setConstraint() {
        container.anchor(top: safeAreaLayoutGuide.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: frame.width, height: 20))
        
        subjectLabel.anchor(top: container.topAnchor, leading: container.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 15, left: 18, bottom: 0, right: 0), size: .init(width: 250, height: 20))
        
        viewRounded.anchor(top: subjectLabel.bottomAnchor, leading: subjectLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 15, left: 0, bottom: 0, right: 0), size: .init(width: 15, height: 15))
        
        nameLabel.anchor(top: viewRounded.topAnchor, leading: viewRounded.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: -2, left: 5, bottom: 0, right: 0), size: .init(width: 80, height: 20))
        
        publicLabel.anchor(top: container.topAnchor, leading: nil, bottom: nil, trailing: container.trailingAnchor, padding: .init(top: 15, left: 0, bottom: 0, right: 13), size: .init(width: 50, height: 20))
    }
}
