//
//  NavBarController.swift
//  Helper
//
//  Created by Владислав Куликов on 26.02.2023.
//

import UIKit

final class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = Resources.Colors.mainBackgroundColor
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Resources.Colors.black,
            .font: Resources.Fonts.mainFont(with: 28)
        ]
    }
    
}
