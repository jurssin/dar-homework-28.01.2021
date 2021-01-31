//
//  LoginViewController.swift
//  Instagram Login Page
//
//  Created by User on 1/28/21.
//  Copyright © 2021 Syrym Zhursin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var iconClick = true
    var isTextFieldsEmpty = true
    
    lazy var quitButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "quit button"), for: .normal)
        button.addTarget(self, action: #selector(quitButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "instagram text logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Телефон, имя пользователя или эл. адрес"
        //textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 0.2
        textField.layer.borderColor = UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1).cgColor
        textField.layer.cornerRadius = 7
        textField.backgroundColor = UIColor(red: 250/255, green: 249/255, blue: 250/255, alpha: 1)
        textField.autocapitalizationType = .none

        textField.setLeftPaddingPoints(15)
        textField.addTarget(self, action: #selector(setEnterButtonBackground), for: .editingChanged)

        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.layer.borderWidth = 0.2
        textField.layer.borderColor = UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1).cgColor
        textField.layer.cornerRadius = 7
        textField.backgroundColor = UIColor(red: 250/255, green: 249/255, blue: 250/255, alpha: 1)
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.setLeftPaddingPoints(15)
        textField.addTarget(self, action: #selector(setEnterButtonBackground), for: .allEditingEvents)

        return textField
    }()
    
    lazy var passwordRightButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "hidden password"), for: .normal)
        button.addTarget(self, action: #selector(changePasswordState), for: .touchUpInside)
        return button
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Забыли пароль?", for: .normal)
        button.setTitleColor(UIColor(red: 59/255, green: 149/255, blue: 238/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(forgotPasswordButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var enterButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor(red: 142/255, green: 200/255, blue: 245/255, alpha: 1)
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(enterButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "или"
        label.textColor = .gray
        return label
    }()
    lazy var facebookLoginView: PrimaryView = {
        let view = PrimaryView()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(facebookLoginButtonTapped))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGestureRecognizer)
        return view
    }()
    
    lazy var registerView: RegisterView = {
        let view = RegisterView()
        
//        view.addBorder(toSide: .Top, withColor: CGColor(srgbRed: 142/255, green: 142/255, blue: 142/255, alpha: 1), andThickness: 10)
        return view
    }()
    
    lazy var leftOrLineView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.3
        view.layer.borderColor = UIColor.systemGray.cgColor
        return view
    }()
    
    lazy var rightOrLineView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.3
        view.layer.borderColor = UIColor.systemGray.cgColor
        return view
    }()
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupViews()
    }

    
    private func setupViews() {

        let uiElements = [quitButton, iconImageView, loginTextField, passwordTextField, passwordRightButton, forgotPasswordButton, enterButton, orLabel, facebookLoginView, registerView, leftOrLineView, rightOrLineView]

        uiElements.forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        quitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        quitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        quitButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        quitButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        iconImageView.topAnchor.constraint(equalTo: quitButton.bottomAnchor, constant: view.frame.height * 0.05).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        loginTextField.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: view.frame.height * 0.02).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordRightButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        passwordRightButton.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 10).isActive = true
        passwordRightButton.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: -10).isActive = true
        passwordRightButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -15).isActive = true
        
        forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 13).isActive = true
        forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        forgotPasswordButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        forgotPasswordButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        enterButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 20).isActive = true
        enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        leftOrLineView.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 30).isActive = true
        leftOrLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        leftOrLineView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -30).isActive = true
        leftOrLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orLabel.centerYAnchor.constraint(equalTo: leftOrLineView.centerYAnchor).isActive = true
        
        rightOrLineView.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor).isActive = true
        rightOrLineView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 30).isActive = true
        rightOrLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        rightOrLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        facebookLoginView.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: view.frame.height * 0.01).isActive = true
//        facebookLoginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
//        facebookLoginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        facebookLoginView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        facebookLoginView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        facebookLoginView.setParameters(imageName: "facebook logo", title: "Войти через Facebook")
        
        registerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        registerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        registerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        registerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        

    }
    
    @objc func changePasswordState() {
        print(#function)
        if(iconClick == true) {
            passwordTextField.isSecureTextEntry = false
            passwordRightButton.setBackgroundImage(UIImage(named: "shown password"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            passwordRightButton.setBackgroundImage(UIImage(named: "hidden password"), for: .normal)
        }

        iconClick = !iconClick
    }
    
    @objc func quitButtonPressed() {
        print(#function)
    }
    @objc func forgotPasswordButtonPressed() {
        print(#function)
    }
    
    @objc func enterButtonPressed() {
        print(#function)
        setEnterButtonBackground()
        guard let password = passwordTextField.text, let login = loginTextField.text else {
            return
        }
        if (password.isEmpty || login.isEmpty) || (password.count < 8) || (password.first!.isLowercase){
            let alert = UIAlertController(title: "Incorrect login or password", message: "Please, provide valid login and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            present(alert, animated: true)
        }
    }
    @objc func facebookLoginButtonTapped() {
        print(#function)
    }
    @objc func registerButtonTapped() {
        print(#function)
    }
    
    @objc func setEnterButtonBackground() {
        guard let password = passwordTextField.text, let login = loginTextField.text else {
            return
        }
        if(password.isEmpty && login.isEmpty) {
            enterButton.backgroundColor = UIColor(red: 142/255, green: 200/255, blue: 245/255, alpha: 1)
        }
        else {
            enterButton.backgroundColor = UIColor(red: 59/255, green: 149/255, blue: 238/255, alpha: 1)
        }
        
        isTextFieldsEmpty = !isTextFieldsEmpty
    }
}

