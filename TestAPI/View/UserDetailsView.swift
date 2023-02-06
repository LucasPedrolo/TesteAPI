//
//  UserDetailsViewController.swift
//  TestAPI
//
//  Created by unicred on 03/02/23.
//

import UIKit

class UserDetailsView: BaseView {
    
    lazy var view: UIView = {
        let view = UIView()
        let color = UIColor(red: 10, green: 25, blue: 36)
        view.backgroundColor = color
        
        return view
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 150
        image.clipsToBounds = true
        
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        
        return label
    }()
    
    lazy var reposLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        
        return label
    }()
    
    lazy var editButton: UIButton = {
        let edit = UIButton(type: .custom)
        edit.setTitle("Edit profile", for: .normal)
        edit.titleLabel?.font = UIFont(name: "Montserrat", size: 0)
        edit.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        edit.setTitleColor(.white, for: .normal)
        edit.layer.masksToBounds = true
        edit.layer.cornerRadius = 8
        edit.layer.borderWidth = 1
        edit.layer.borderColor = UIColor(red: 44, green: 55, blue: 55).cgColor
        edit.backgroundColor = UIColor(red: 44, green: 44, blue: 44)
        
        return edit
    }()
    
    lazy var followersButton: UIButton = {
        let button = UIButton(type: .custom)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        return button
    }()
    
    lazy var followingButton: UIButton = {
        let button = UIButton(type: .custom)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        return button
    }()
    
    lazy var pointLabel: UILabel = {
        let label = UILabel()
        label.text = "·"
        label.textColor = .white
        
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(frame: self.bounds)
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = 0
        stack.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return stack
    }()
    
    lazy var emojiButton: UIButton = {
        let emoji = UIButton(type: .custom)
        let image = UIImage(named: "emoji")
        emoji.setBackgroundImage(image, for: UIControl.State.normal)
        emoji.layer.borderWidth = 1
        emoji.layer.borderColor = UIColor.purple.cgColor
        emoji.layer.cornerRadius = 10
        emoji.backgroundColor = .white
        
        
        return emoji
    }()
    
    override func addSubviews() {
        addSubview(view)
        view.addSubview(editButton)
        view.addSubview(loginLabel)
        view.addSubview(nameLabel)
        view.addSubview(reposLabel)
        view.addSubview(image)
        view.addSubview(stackView)
        stackView.addArrangedSubview(followersButton)
        stackView.addArrangedSubview(pointLabel)
        stackView.addArrangedSubview(followingButton)
        view.addSubview(emojiButton)
    }
    
    override func setConstraints() {
        
        view.anchor(top: safeAreaLayoutGuide.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: frame.width, height: frame.height))
        
        image.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 45, bottom: 0, right: 0) , size: .init(width: 300, height: 300))
        
        nameLabel.anchor(top: image.topAnchor, leading: image.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 320, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 20))
        
        loginLabel.anchor(top: nameLabel.bottomAnchor, leading: nameLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 3, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 20))
        
        editButton.anchor(top: loginLabel.bottomAnchor, leading: loginLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 15, left: 0, bottom: 0, right: 0), size: .init(width: 300, height: 35))
        
        stackView.anchor(top: editButton.bottomAnchor, leading: editButton.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 12, left: 0, bottom: 0, right: 0), size: .init(width: 210, height: 20))
        
        emojiButton.anchor(top: stackView.bottomAnchor, leading: stackView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 1000, left: 0, bottom: 0, right: 0), size: .init(width: 150, height: 150))
    }
}
