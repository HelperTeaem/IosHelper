//
//  ArticlesController.swift
//  Helper
//
//  Created by Владислав Куликов on 26.02.2023.
//

import UIKit

final class ArticlesController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Resources.Colors.mainBackgroundColor
        title = "HELPER"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.articles
    }
}
