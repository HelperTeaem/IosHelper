//
//  NavBarController.swift
//  Helper
//
//  Created by Владислав Куликов on 26.02.2023.
//

import UIKit

final class NavBarMainController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = Resources.Colors.mainGreen
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Resources.Colors.titleColor,
            .font: Resources.Fonts.titleFont(with: 28)
        ]
    }
}
