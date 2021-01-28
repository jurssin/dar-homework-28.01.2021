//
//  PrimaryView.swift
//  Instagram Login Page
//
//  Created by User on 1/28/21.
//  Copyright © 2021 Syrym Zhursin. All rights reserved.
//

import UIKit

class PrimaryView: UIView {
    
    lazy var leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "facebook logo")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect = .zero) {
            super.init(frame: frame)
            setupViews()
            setStyle()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        public func setParameters(imageName: String, title: String) {
            self.titleLabel.text = title
            guard let image = UIImage(named: imageName) else { return }
            self.leftImageView.image = image
        }
        private func setupViews() {
            [leftImageView, titleLabel].forEach {
                self.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
            leftImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 6).isActive = true
            leftImageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -5).isActive = true
            leftImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6).isActive = true
            leftImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            
            titleLabel.centerXAnchor.constraint(equalTo: super.centerXAnchor).isActive = true
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
        
        private func setStyle() {
            self.layer.cornerRadius = 8
            self.titleLabel.textColor = UIColor(red: 59/255, green: 149/255, blue: 238/255, alpha: 1)
            self.titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
            self.layer.borderWidth = 0
            self.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 222/255, alpha: 1).cgColor
        }
}

