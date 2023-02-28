//
//  RegisteredController.swift
//  Helper
//
//  Created by Владислав Куликов on 27.02.2023.
//

import UIKit
import FirebaseAuth

final class RegistrationController: BaseController {
    
    private lazy var login: UITextField = {
        let login = UITextField()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.backgroundColor = Resources.Colors.white
        login.layer.cornerRadius = 17
        login.placeholder = "Логин"
        login.leftViewMode = UITextField.ViewMode.always
        login.leftView = UIView(frame:CGRect(x:0, y:0, width: 10, height: 10))
        login.layer.shadowColor = Resources.Colors.textColor.cgColor
        login.layer.shadowOffset = CGSize(width: 2, height: 2)
        login.layer.shadowRadius = 4
        login.layer.shadowOpacity = 0.7
        return login
    }()
    
    private lazy var errorLabel: UILabel = {
        let errorLabel = UILabel()
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textColor = Resources.Colors.red
        errorLabel.text = " "
        errorLabel.textAlignment = .center
        errorLabel.backgroundColor = Resources.Colors.mainBackgroundColor
        return errorLabel
    }()
    
    private lazy var email: UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.backgroundColor = Resources.Colors.white
        email.layer.cornerRadius = 17
        email.placeholder = "Почта"
        email.leftViewMode = UITextField.ViewMode.always
        email.leftView = UIView(frame:CGRect(x:0, y:0, width: 10, height: 10))
        email.layer.shadowColor = Resources.Colors.textColor.cgColor
        email.layer.shadowOffset = CGSize(width: 2, height: 2)
        email.layer.shadowRadius = 4
        email.layer.shadowOpacity = 0.7
        return email
    }()
    
    private lazy var password: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.backgroundColor = Resources.Colors.white
        password.layer.cornerRadius = 17
        password.placeholder = "Пароль"
        password.leftViewMode = UITextField.ViewMode.always
        password.leftView = UIView(frame:CGRect(x:0, y:0, width: 10, height: 10))
        password.layer.shadowColor = Resources.Colors.textColor.cgColor
        password.layer.shadowOffset = CGSize(width: 2, height: 2)
        password.layer.shadowRadius = 4
        password.layer.shadowOpacity = 0.7
        return password
    }()
    
    private lazy var againPassword: UITextField = {
        let againPassword = UITextField()
        againPassword.translatesAutoresizingMaskIntoConstraints = false
        againPassword.backgroundColor = Resources.Colors.white
        againPassword.layer.cornerRadius = 17
        againPassword.placeholder = "Подтвердите пароль"
        againPassword.leftViewMode = UITextField.ViewMode.always
        againPassword.leftView = UIView(frame:CGRect(x:0, y:0, width: 10, height: 10))
        againPassword.layer.shadowColor = Resources.Colors.textColor.cgColor
        againPassword.layer.shadowOffset = CGSize(width: 2, height: 2)
        againPassword.layer.shadowRadius = 4
        againPassword.layer.shadowOpacity = 0.7
        return againPassword
    }()
    
    private lazy var register: UIButton = {
        let register = UIButton()
        register.translatesAutoresizingMaskIntoConstraints = false
        register.backgroundColor = Resources.Colors.mainGreen
        register.layer.cornerRadius = 17
        register.setTitle("Регистрация", for: .normal)
        register.setTitleColor(Resources.Colors.white, for: .normal)
        register.addTarget(self, action: #selector(OnTabRegister), for: .touchUpInside)
        return register
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutConstraint()
        configureNavigationBar()
        view.backgroundColor = Resources.Colors.mainBackgroundColor
    }
    
    private func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(onAddTap))
        navigationItem.rightBarButtonItem?.tintColor = Resources.Colors.tintElementsColor
        navigationItem.leftBarButtonItem = UIBarButtonItem()
        navigationItem.title = ""
    }
    
    func layoutConstraint() {
        view.addSubview(login)
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(againPassword)
        view.addSubview(register)
        view.addSubview(errorLabel)
        NSLayoutConstraint.activate([
            errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            errorLabel.topAnchor.constraint(equalTo: view.topAnchor),
            view.trailingAnchor.constraint(equalTo: errorLabel.trailingAnchor, constant: 30),
            errorLabel.bottomAnchor.constraint(equalTo: errorLabel.topAnchor, constant: 50),
            
            login.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            login.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: login.trailingAnchor, constant: 30),
            login.bottomAnchor.constraint(equalTo: login.topAnchor, constant: 50),
            
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            email.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: email.trailingAnchor, constant: 30),
            email.bottomAnchor.constraint(equalTo: email.topAnchor, constant: 50),
            
            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: password.trailingAnchor, constant: 30),
            password.bottomAnchor.constraint(equalTo: password.topAnchor, constant: 50),
            
            againPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            againPassword.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: againPassword.trailingAnchor, constant: 30),
            againPassword.bottomAnchor.constraint(equalTo: againPassword.topAnchor, constant: 50),
            
            register.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            register.topAnchor.constraint(equalTo: againPassword.bottomAnchor, constant: 70),
            view.trailingAnchor.constraint(equalTo: register.trailingAnchor, constant: 60),
            register.bottomAnchor.constraint(equalTo: register.topAnchor, constant: 50),
        ])
    }
    
    @objc
    func onAddTap() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @objc
    func OnTabRegister() {
        test[0].entered = true
        test[0].password = password.text ?? " "
        test[0].email = email.text ?? " "
        test[0].login = login.text ?? " "
        Auth.auth().createUser(withEmail: email.text ?? " ", password: password.text ?? " ") { authResult, error in
            if error == nil {
                let vc = PersonalController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else {
                self.errorLabel.text = "Что-то пошло не так"
            }
        }
    }
}
