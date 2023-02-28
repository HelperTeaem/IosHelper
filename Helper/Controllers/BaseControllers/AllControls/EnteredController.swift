//
//  EnteredController.swift
//  Helper
//
//  Created by Владислав Куликов on 26.02.2023.
//

import UIKit
import FirebaseAuth

class EnteredController: BaseController {
    
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
        password.isSecureTextEntry = true
        password.leftView = UIView(frame:CGRect(x:0, y:0, width: 10, height: 10))
        password.layer.shadowColor = Resources.Colors.textColor.cgColor
        password.layer.shadowOffset = CGSize(width: 2, height: 2)
        password.layer.shadowRadius = 4
        password.layer.shadowOpacity = 0.7
        return password
    }()
    
    private lazy var entered: UIButton = {
        let buttonEnter = UIButton()
        buttonEnter.translatesAutoresizingMaskIntoConstraints = false
        buttonEnter.backgroundColor = Resources.Colors.mainGreen
        buttonEnter.layer.cornerRadius = 17
        buttonEnter.setTitle("Вход", for: .normal)
        buttonEnter.setTitleColor(Resources.Colors.white, for: .normal)
        buttonEnter.addTarget(self, action: #selector(onTapEnter), for: .touchUpInside)
        return buttonEnter
    }()
    
    private lazy var or: UILabel = {
        let or = UILabel()
        or.translatesAutoresizingMaskIntoConstraints = false
        or.text = "или"
        or.textColor = UIColor.systemGray
        return or
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
    
    private func configureNavigationBar() {
        let navigationBar = self.navigationController?.navigationBar
        navigationItem.leftBarButtonItem = UIBarButtonItem()
        navigationItem.title = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutConstraint()
        configureNavigationBar()
    }
    
    func layoutConstraint() {
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(entered)
        view.addSubview(or)
        view.addSubview(register)
        NSLayoutConstraint.activate([
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            email.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            view.trailingAnchor.constraint(equalTo: email.trailingAnchor, constant: 50),
            email.bottomAnchor.constraint(equalTo: email.topAnchor, constant: 50),
            
            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: password.trailingAnchor, constant: 50),
            password.bottomAnchor.constraint(equalTo: password.topAnchor, constant: 50),
            
            entered.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            entered.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 50),
            view.trailingAnchor.constraint(equalTo: entered.trailingAnchor, constant: 80),
            entered.bottomAnchor.constraint(equalTo: entered.topAnchor, constant: 50),
            
            or.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width / 2.16),
            or.topAnchor.constraint(equalTo: entered.bottomAnchor, constant: 0),
            or.bottomAnchor.constraint(equalTo: or.topAnchor, constant: 50),
            
            register.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            register.topAnchor.constraint(equalTo: or.bottomAnchor, constant: 0),
            view.trailingAnchor.constraint(equalTo: register.trailingAnchor, constant: 80),
            register.bottomAnchor.constraint(equalTo: register.topAnchor, constant: 50)
        ])
    }
    
    // Admin@gmail.com Admin1
    
    @objc
    func onTapEnter() {
        Auth.auth().signIn(withEmail: email.text ?? " ", password: password.text ?? " ") { [weak self] authResult, error in
            if error == nil {
                test[0].entered = true
                _ = self?.navigationController?.popViewController(animated: true)
            } else {
                
            }
        }
        
    }
    
    @objc
    func OnTabRegister() {
        let vc = RegistrationController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


