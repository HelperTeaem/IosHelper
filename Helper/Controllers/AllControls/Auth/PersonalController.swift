//
//  PersonalController.swift
//  Helper
//
//  Created by Владислав Куликов on 26.02.2023.
//

import UIKit
import Firebase

final class PersonalController: BaseController {
    
    //MARK: Конфигурируем элементы
    
    private lazy var labelLogin: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Загружаем данные"
        label.textColor = Resources.Colors.textColor
        label.font = Resources.Fonts.mainFont(with: 24)
        return label
    }()
    
    private lazy var labelEmail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Resources.Colors.textColor
        label.font = Resources.Fonts.mainFont(with: 20)
        return label
    }()
    
    private lazy var buttonFavourite: UIButton = {
        let  button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Resources.Colors.buttonColor
        button.layer.cornerRadius = 5
        button.setTitle("Избранное", for: .normal)
        button.setTitleColor(Resources.Colors.textColor, for: .normal)
        button.layer.shadowColor = Resources.Colors.textColor.cgColor
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets.left = 18
        button.titleLabel?.font = Resources.Fonts.mainFont(with: 20)
        return button
    }()
    
    private lazy var buttonCollection: UIButton = {
        let  button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Resources.Colors.buttonColor
        button.layer.cornerRadius = 5
        button.setTitle("Мои комплектующие", for: .normal)
        button.setTitleColor(Resources.Colors.textColor, for: .normal)
        button.layer.shadowColor = Resources.Colors.textColor.cgColor
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets.left = 18
        button.titleLabel?.font = Resources.Fonts.mainFont(with: 20)
        
        return button
    }()
    
    private lazy var buttonSettings: UIButton = {
        let  button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Resources.Colors.buttonColor
        button.layer.cornerRadius = 5
        button.setTitle("Настройки ", for: .normal)
        button.setTitleColor(Resources.Colors.textColor, for: .normal)
        button.layer.shadowColor = Resources.Colors.textColor.cgColor
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets.left = 18
        button.titleLabel?.font = Resources.Fonts.mainFont(with: 20)
        
        return button
    }()
    
    //MARK: Загрузка вьюхи
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                let vc = EnteredController()
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                self.view.backgroundColor = Resources.Colors.mainBackgroundColor
                self.navigationController?.tabBarItem.title = Resources.Strings.TabBar.personal
                self.layoutConstraint()
                self.getLogin()
                self.getEmail()
            }
        }
    }
    
    //MARK: Реализации функций
    
    private func configureNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem()
        navigationItem.title = ""
        navigationItem.rightBarButtonItem = UIBarButtonItem( barButtonSystemItem: .done, target: self, action: #selector(onTabExit))
    }
    
    func layoutConstraint() {
        view.addSubview(labelLogin)
        view.addSubview(labelEmail)
        view.addSubview(buttonFavourite)
        view.addSubview(buttonCollection)
        view.addSubview(buttonSettings)
        
        NSLayoutConstraint.activate([
            labelLogin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelLogin.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            
            labelEmail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelEmail.topAnchor.constraint(equalTo: labelLogin.bottomAnchor, constant: 6),
            
            buttonFavourite.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            buttonFavourite.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 55),
            view.trailingAnchor.constraint(equalTo: buttonFavourite.trailingAnchor, constant: 5),
            buttonFavourite.bottomAnchor.constraint(equalTo: buttonFavourite.topAnchor, constant: 70),
            
            buttonCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            buttonCollection.topAnchor.constraint(equalTo: buttonFavourite.bottomAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: buttonCollection.trailingAnchor, constant: 5),
            buttonCollection.bottomAnchor.constraint(equalTo: buttonCollection.topAnchor, constant: 70),
            
            buttonSettings.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            buttonSettings.topAnchor.constraint(equalTo: buttonCollection.bottomAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: buttonSettings.trailingAnchor, constant: 5),
            buttonSettings.bottomAnchor.constraint(equalTo: buttonSettings.topAnchor, constant: 70)
        ])
    }
    
    private func getLogin() {
        let userID = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(userID!).observeSingleEvent(of: .value, with: { snapshot in
            
          let value = snapshot.value as? NSDictionary
            self.labelLogin.text = value?["login"] as? String ?? ""
            
        }) { error in
          print(error.localizedDescription)
        }
    }
    
    private func getEmail() {
        let userID = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(userID!).observeSingleEvent(of: .value, with: { snapshot in
            
          let value = snapshot.value as? NSDictionary
            self.labelEmail.text = value?["login"] as? String ?? ""
            
        }) { error in
          print(error.localizedDescription)
        }
    }
    
    //MARK: Таргеты
    
    @objc
    func onTabExit() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
