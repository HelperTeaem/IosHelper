//
//  ViewController.swift
//  Helper
//
//  Created by Владислав Куликов on 25.02.2023.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
}

@objc extension BaseController {
    func configure() {
        view.backgroundColor = Resources.Colors.mainBackgroundColor
    }
}

