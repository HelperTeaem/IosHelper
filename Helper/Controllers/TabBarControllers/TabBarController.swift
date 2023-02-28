//
//  TabBarController.swift
//  Helper
//
//  Created by Владислав Куликов on 25.02.2023.
//

import UIKit

enum Tabs: Int {
    case main
    case articles
    case personal
}
                

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        tabBar.barTintColor = Resources.Colors.inactive
        tabBar.tintColor = Resources.Colors.active
        tabBar.backgroundColor = Resources.Colors.mainGreen
        tabBar.layer.masksToBounds = true

        let aticlesController = ArticlesController()
        let mainController = MainController()
        let personalController = PersonalController()
        //MARK: Добавить сюда остальную парашу чтобы не было лагов с ебанной навгацией при регистрации
        
        let articlesNavigation =
        NavBarMainController(rootViewController:aticlesController)
        let mainNavigation =
        NavBarMainController(rootViewController:mainController)
        let personalNavigation =
        NavBarController(rootViewController:personalController)
        
        articlesNavigation.tabBarItem =
        UITabBarItem(title: Resources.Strings.TabBar.articles, image: Resources.Images.TabBar.articles, tag: Tabs.articles.rawValue)
        
        mainNavigation.tabBarItem =
        UITabBarItem(title: Resources.Strings.TabBar.main, image: Resources.Images.TabBar.main, tag: Tabs.main.rawValue)
        
        personalNavigation.tabBarItem =
        UITabBarItem(title: Resources.Strings.TabBar.personal, image: Resources.Images.TabBar.personal, tag: Tabs.personal.rawValue)

        setViewControllers([articlesNavigation, mainNavigation, personalNavigation], animated: false)
    }
}
