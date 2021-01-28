//
//  RegisterView.swift
//  Instagram Login Page
//
//  Created by User on 1/28/21.
//  Copyright © 2021 Syrym Zhursin. All rights reserved.
//

import UIKit

class RegisterView: UIView {
    
    lazy var registerLabel: UILabel = {
        let label = UILabel()
        label.text = "У вас нет аккаунта?"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегестрируйтесь.", for: .normal)
        button.setTitleColor(UIColor(red: 59/255, green: 149/255, blue: 238/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let uiElements = [registerLabel, registerButton]
        uiElements.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        registerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        registerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -70).isActive = true
        
        registerButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: registerLabel.trailingAnchor, constant: 5).isActive = true
    }
    
    private func setStyle() {
        self.layer.borderWidth = 0.3
        self.layer.borderColor = UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1).cgColor
    }
    
    @objc func registerButtonPressed() {
        print(#function)
        print(self.bounds.width)

    }
    
}
