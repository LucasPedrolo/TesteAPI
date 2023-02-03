//
//  UserDetailsViewController.swift
//  TestAPI
//
//  Created by unicred on 03/02/23.
//

import UIKit

class UserDetailsView: BaseView {
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 120
        image.clipsToBounds = true
        
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    lazy var reposLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override func addSubviews() {
        addSubview(nameLabel)
        addSubview(reposLabel)
        addSubview(image)
    }
    
    override func setConstraints() {
        
        image.anchor(top: safeAreaLayoutGuide.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 70, bottom: 0, right: 0), size: .init(width: 250, height: 250))
        
        nameLabel.anchor(top: image.topAnchor, leading: image.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 400, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 50))
        
        reposLabel.anchor(top: nameLabel.bottomAnchor, leading: nameLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 50, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 50))
    }
}

extension UIImageView {
    func load(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
