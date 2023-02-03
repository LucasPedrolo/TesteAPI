//
//  HomeView.swift
//  TestAPI
//
//  Created by unicred on 01/02/23.
//

import UIKit

class HomeView: BaseView {
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gitIcon")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var searchTxtField: UITextField = {
        let search = UITextField()
        search.placeholder = "Search"
        search.borderStyle = UITextField.BorderStyle.roundedRect
        search.autocorrectionType = UITextAutocorrectionType.no
        search.keyboardType = UIKeyboardType.default
        search.returnKeyType = UIReturnKeyType.done
        search.clearButtonMode = UITextField.ViewMode.whileEditing
        search.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        search.autocapitalizationType = .none
        
        return search
    }()

    lazy var searchButton: UIButton = {
        let search = UIButton(type: .custom)
        search.setTitle("Search", for: .normal)
        search.titleLabel?.font = UIFont(name: "Montserrat", size: 0)
        search.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        search.setTitleColor(.white, for: .normal)
        search.layer.masksToBounds = true
        search.layer.cornerRadius = 20
        search.layer.borderWidth = 2
        search.backgroundColor = .black
        
        return search
    }()
    
    override func addSubviews() {
        addSubview(image)
        addSubview(searchTxtField)
        addSubview(searchButton)
    }
    
    override func setConstraints() {
        image.anchor(top: safeAreaLayoutGuide.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 70, bottom: 0, right: 0), size: .init(width: 250, height: 250))
        
        searchTxtField.anchor(top: image.bottomAnchor, leading: image.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 100, left: -25, bottom: 0, right: 0), size: .init(width: 300, height: 50))
        
        searchButton.anchor(top: searchTxtField.bottomAnchor, leading: searchTxtField.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 150, left: 50, bottom: 0, right: 0), size: .init(width: 200, height: 50))
    }
}
