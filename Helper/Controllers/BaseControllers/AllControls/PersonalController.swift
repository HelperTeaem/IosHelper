//
//  PersonalController.swift
//  Helper
//
//  Created by Владислав Куликов on 26.02.2023.
//

import UIKit

final class PersonalController: BaseController {
    
    private lazy var labelLogin: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //MARK: удалить эту парашу
        label.text = test[0].login
        label.textColor = Resources.Colors.textColor
        label.font = Resources.Fonts.mainFont(with: 24)
        return label
    }()
    
    private lazy var labelEmail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //MARK: удалить эту парашу
        label.text = test[0].email
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let navigationBar = self.navigationController?.navigationBar
        navigationItem.leftBarButtonItem = UIBarButtonItem()
        navigationItem.title = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                if test[0].entered == true {
                    view.backgroundColor = Resources.Colors.mainBackgroundColor
                    navigationController?.tabBarItem.title = Resources.Strings.TabBar.personal
                    layoutConstraint()
                } else {
                        let vc = EnteredController()
                        self.navigationController?.pushViewController(vc, animated: true)
                }
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
}
